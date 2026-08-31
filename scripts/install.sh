#!/bin/sh


# ======================
# Configuracao e variaveis
# ======================
#  -e (errexit): faz o script parar imediatamente se qualquer comando retornar código de saída diferente de zero
#  -u (nounset): faz o script falhar se tentar usar uma variável que não foi definida
set -eu

REPO="MagaluCloud/mgccli"
GITHUB_RELEASES="https://github.com/${REPO}/releases"
LATEST_URL="${GITHUB_RELEASES}/latest"
DOWNLOAD_BASE_URL="${GITHUB_RELEASES}/download"
BIN_NAME="mgc"

OPT_VERSION=""
OPT_SYSTEM=0
OPT_QUIET=0

# ======================
# Variaveis de instalacao
# ======================
SO=""                           # "linux" | "macos" | freebsd
ARCH=""                         # "x86_64" | "aarch64"
TERMINAL=""                     # "bash" | "zsh"
REAL_HOME=""                    # home do usuario real (considera SUDO_USER)
REAL_SHELL=""                   # shell do usuario real (considera SUDO_USER)
VERSION=""                      # versao alvo a ser instalada (definida em resolve_target_version)
PREVIOUS_PATHS=""               # lista de caminhos de instalacoes anteriores, um por linha
PREVIOUS_VERSIONS=""            # versoes correspondentes, na mesma ordem de PREVIOUS_PATHS
HIGHEST_INSTALLED_VERSION=""    # maior versao entre as instalacoes anteriores encontradas
TEMP_DIR=""                     # diretorio temporario criado por setup_temp_dir
FILENAME=""                     # nome do arquivo tar.gz a ser baixado
INSTALLER_URL=""                # url completa do tar.gz
CHECKSUM_URL=""                 # url completa do arquivo de checksums do release
CHECKSUM_CMD=""                 # comando usado para calcular sha256 (definido em verify_dependencies)

# ======================
# Variaveis de output
# ======================
COLOR_GREEN=""
COLOR_RED=""
COLOR_YELLOW=""
COLOR_RESET=""

# ======================
# Output Configuration
# ======================
setup_colors() {
    if [ -n "${NO_COLOR:-}" ] || [ "${TERM:-}" = "dumb" ]; then
        return 0
    fi

    COLOR_GREEN=$(printf '\033[32m')
    COLOR_RED=$(printf '\033[31m')
    COLOR_YELLOW=$(printf '\033[33m')
    COLOR_RESET=$(printf '\033[0m')
}


log() {
    [ "$OPT_QUIET" = "1" ] && return 0
    printf "%b==>%b %s\n" "$COLOR_GREEN" "$COLOR_RESET" "$1"
}
warn() { printf "%b==> aviso:%b %s\n" "$COLOR_YELLOW" "$COLOR_RESET" "$1" >&2; }
error()  { printf "%b==> erro:%b %s\n" "$COLOR_RED" "$COLOR_RESET" "$1" >&2; exit 1; }

# ======================
# Ajuda e parse de argumentos
# ======================
usage() {
    cat <<'EOF'
Instalador da MGC CLI

Uso:
  install.sh [FLAGS]

Flags:
  --version <X.Y.Z>         Instala uma versão específica (ex: 0.61.0).
                            Se essa flag nao for configurada, sera instalada a ultima versao.
                            Downgrades (instalar uma versao mais antiga que a ja instalada) nao sao suportados.
  --system                  Instala em /usr/local/bin (requer root/sudo), em vez do padrao user-local ($HOME/.local).
  --quiet                   Suprime output nao-essencial. Erros e avisos continuam sendo exibidos.
  --help                    Mostra esta ajuda.

Exemplos:
  sh install.sh
  sh install.sh --version 0.61.0
  sh install.sh --system
  sh install.sh --help
EOF
}

parse_args() {
    while [ $# -gt 0 ]; do
        case "$1" in
        --version)
                [ $# -ge 2 ] || error "--version exige um argumento, ex: --version 0.61.0"
                OPT_VERSION="$2"
                shift 2
                ;;
            --version=*)
                OPT_VERSION="${1#--version=}"
                [ -n "$OPT_VERSION" ] || error "--version exige um argumento, ex: --version=0.61.0"
                shift
                ;;
            --system)
                OPT_SYSTEM=1
                shift
                ;;
            --quiet)
                OPT_QUIET=1
                shift
                ;;
            --help|-h)
                usage
                exit 0
                ;;
            *) # Qualquer outro argumento
                error "flag desconhecida: $1 (use --help para ver as opções)"
                ;;
        esac
    done
}

# ======================
# Deteccao e validacoes iniciais
# ======================
detect_os() {
    case "$(uname -s)" in
        Linux)   SO="linux" ;;
        Darwin)  SO="macos" ;;
        FreeBSD) SO="freebsd" ;;
        *) error "sistema operacional não suportado: $(uname -s). Baixe manualmente em ${GITHUB_RELEASES}" ;;
    esac
}

detect_arch() {
    case "$(uname -m)" in
        x86_64|amd64)  ARCH="amd64" ;;
        aarch64|arm64) ARCH="arm64" ;;
        *) error "arquitetura não suportada: $(uname -m). Baixe manualmente em ${GITHUB_RELEASES}" ;;
    esac
}

verify_dependencies() {
  required="curl mktemp uname tar"
  case "$SO" in
    linux|freebsd|macos) ;;
    *) error "Erro interno: Sistema operacional nao reconhecido '$SO'" ;;
  esac

  missing=""
  for cmd in $required; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      missing="$missing $cmd"
    fi
  done

  if command -v sha256sum >/dev/null 2>&1; then
    CHECKSUM_CMD="sha256sum"
  elif command -v shasum >/dev/null 2>&1; then
    CHECKSUM_CMD="shasum -a 256"
  else
    missing="$missing sha256sum"
  fi

  if [ -n "$missing" ]; then
    error "Dependencias nao encontradas:$missing. Instale-as e tente novamente."
  fi
}

previlege_check() {
    if [ "$OPT_SYSTEM" -eq 1 ] && [ "$(id -u)" -ne 0 ]; then
        error "O comando sudo é necessário para essa operação."
    fi
    return 0
}

resolve_install_dirs() {
    if [ "$OPT_SYSTEM" = "1" ]; then
        BIN_DIR="/usr/local/bin"
        DATA_DIR="/usr/local/share/mgccli"
        return
    fi

    BIN_DIR="$REAL_HOME/.local/bin"
    DATA_DIR="$REAL_HOME/.local/share/mgccli"
}

resolve_real_user() {
    REAL_HOME="$HOME"
    REAL_SHELL="${SHELL:-}"

    if [ "$(id -u)" -eq 0 ] && [ -n "${SUDO_USER:-}" ] && command -v getent >/dev/null 2>&1; then
        passwd_entry=$(getent passwd "$SUDO_USER" 2>/dev/null) || passwd_entry=""
        if [ -n "$passwd_entry" ]; then
            parsed_home=$(printf '%s' "$passwd_entry" | cut -d: -f6)
            parsed_shell=$(printf '%s' "$passwd_entry" | cut -d: -f7)
            if [ -n "$parsed_home" ] && [ -d "$parsed_home" ]; then
                REAL_HOME="$parsed_home"
            fi
            [ -n "$parsed_shell" ] && REAL_SHELL="$parsed_shell"
        fi
    fi
}

verify_terminal() {
    shell_name="${REAL_SHELL##*/}"
    case "$shell_name" in
        bash|zsh) TERMINAL="$shell_name" ;;
        *) TERMINAL="" ;;
    esac
}

# Rodando via sudo, tudo que criamos nasce com dono root. Devolve ao usuario
# real a posse dos arquivos gravados dentro do home dele.
restore_ownership() {
    [ "$(id -u)" -eq 0 ] && [ -n "${SUDO_USER:-}" ] || return 0

    owner="${SUDO_UID:-$SUDO_USER}"
    [ -n "${SUDO_GID:-}" ] && owner="$owner:$SUDO_GID"

    for target in "$@"; do
        [ -e "$target" ] || continue
        chown -R "$owner" "$target" 2>/dev/null \
            || warn "nao foi possivel ajustar o dono de $target para $SUDO_USER"
    done
    return 0
}

# ======================
# Resolucao de versao e instalacoes anteriores
# ======================
resolve_target_version() {
    if [ -n "$OPT_VERSION" ]; then
        VERSION="$OPT_VERSION"
    else
        latest_url_effective=$(curl --fail -Ls -o /dev/null -w '%{url_effective}\n' "$LATEST_URL" 2>/dev/null) \
            || error "falha ao consultar a ultima versao em $LATEST_URL"
        VERSION=$(printf '%s' "$latest_url_effective" | sed 's|.*/tag/v||')
    fi

    printf '%s' "$VERSION" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$' \
        || error "versao invalida: '$VERSION' (formato esperado: X.Y.Z)."
}

capture_previous_insallation(){
    path_bin=$(command -v "$BIN_NAME" 2>/dev/null) || path_bin=""

    candidates=$(printf '%s\n' \
        "/usr/local/bin/$BIN_NAME" \
        "$REAL_HOME/.local/bin/$BIN_NAME" \
        "$path_bin" \
        | sort -u)

    regex_version='s/.*v\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/p'
    for candidate in $candidates; do
        [ -x "$candidate" ] || continue
        version=$("$candidate" --version 2>/dev/null | head -n1 | sed -n "$regex_version")
        # Sem placeholder, uma versao vazia sumiria na expansao de PREVIOUS_VERSIONS
        # e desalinharia os indices em relacao a PREVIOUS_PATHS.
        [ -n "$version" ] || version="unknown"
        PREVIOUS_PATHS="$PREVIOUS_PATHS $candidate"
        PREVIOUS_VERSIONS="$PREVIOUS_VERSIONS $version"
    done
}

get_highest_installed_version(){
    HIGHEST_INSTALLED_VERSION=$(printf '%s\n' $PREVIOUS_VERSIONS \
        | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' \
        | sort -t. -k1,1n -k2,2n -k3,3n \
        | tail -n1)
}

is_downgrade() {
    [ -n "$HIGHEST_INSTALLED_VERSION" ] || return 0

    v_x=$(echo "$VERSION" | cut -d. -f1)
    v_y=$(echo "$VERSION" | cut -d. -f2)
    v_z=$(echo "$VERSION" | cut -d. -f3)

    i_x=$(echo "$HIGHEST_INSTALLED_VERSION" | cut -d. -f1)
    i_y=$(echo "$HIGHEST_INSTALLED_VERSION" | cut -d. -f2)
    i_z=$(echo "$HIGHEST_INSTALLED_VERSION" | cut -d. -f3)

    downgrade=0
    if [ "$i_x" -gt "$v_x" ]; then
        downgrade=1
    elif [ "$i_x" -eq "$v_x" ] && [ "$i_y" -gt "$v_y" ]; then
        downgrade=1
    elif [ "$i_x" -eq "$v_x" ] && [ "$i_y" -eq "$v_y" ] && [ "$i_z" -gt "$v_z" ]; then
        downgrade=1
    fi

    if [ "$downgrade" -eq 1 ]; then
        error "Foi detectado downgrade (versao instalada: $HIGHEST_INSTALLED_VERSION, versao alvo: $VERSION). Desinstale manualmente as versoes anteriores e tente novamente."
    fi
}

# ======================
# Diretorio temporario e montagem de URLs
# ======================
cleanup() {
    exit_code=$?
    if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR" 2>/dev/null || warn "nao foi possivel remover o diretorio temporario: $TEMP_DIR"
    fi
    exit "$exit_code"
}

setup_temp_dir() {
    TEMP_DIR=$(mktemp -d 2>/dev/null) || error "falha ao criar diretorio temporario (mktemp -d)"
    trap cleanup EXIT INT TERM
}

build_filename() {
    FILENAME="mgccli_${VERSION}_${SO}_${ARCH}.tar.gz"
}

build_installer_url() {
    INSTALLER_URL="$DOWNLOAD_BASE_URL/v$VERSION/$FILENAME"
}

build_checksum_url() {
    CHECKSUM_URL="$DOWNLOAD_BASE_URL/v$VERSION/mgccli_${VERSION}_checksums.txt"
}

# ======================
# Download
# ======================
curl_to_download() {
    url="$1"
    output="$2"

    progress_flag="--progress-bar"
    if [ "$OPT_QUIET" -eq 1 ]; then
        progress_flag="--silent"
    fi
    curl --fail --location --show-error "$progress_flag" \
         --connect-timeout 10 --retry 0 \
         --output "$output" "$url"
}

download_with_retry() {
    url="$1"
    output="$2"
    label="$3"

    log "Baixando $label de $url"
    if curl_to_download "$url" "$output"; then
      return 0
    fi

    warn "O download de $label falhou; tentando novamente"
    if curl_to_download "$url" "$output"; then
        return 0
    fi
    error "Falha ao baixar $label de $url depois de 2 tentativas"
}

download_instalation_file() {
    INSTALLER_PATH="$TEMP_DIR/$FILENAME"
    download_with_retry "$INSTALLER_URL" "$INSTALLER_PATH" "Inatalador do MGC CLI"
}

download_checksum_file() {
    CHECKSUM_PATH="$TEMP_DIR/checksum.txt"
    download_with_retry "$CHECKSUM_URL" "$CHECKSUM_PATH" "Checksum do MGC CLI"
}

# ======================
# Verificacao de checksum
# ======================
verify_checksum() {
    actual=$($CHECKSUM_CMD "$INSTALLER_PATH" | awk '{print $1}')

    expected=$(awk -v filename="$FILENAME" '$2 == filename { print $1 }' "$CHECKSUM_PATH")
    [ -n "$expected" ] || error "Checksum de $FILENAME nao encontrado em $CHECKSUM_PATH"

    if [ "$actual" != "$expected" ]; then
        error "Checksum invalido para $FILENAME (esperado: $expected, obtido: $actual)"
    fi
}

# ======================
# Instalacao
# ======================
install() {
    extract_dir="$TEMP_DIR/extracted"
    if ! mkdir -p "$extract_dir"; then
        error "falha ao criar diretorio de extracao: $extract_dir"
    fi
    if ! tar -xzf "$INSTALLER_PATH" -C "$extract_dir"; then
        error "falha ao extrair $INSTALLER_PATH"
    fi

    bin_dir_existed=1
    [ -d "$BIN_DIR" ] || bin_dir_existed=0
    if ! mkdir -p "$BIN_DIR"; then
        error "falha ao criar diretorio de instalacao: $BIN_DIR"
    fi
    # Escreve ao lado e renomeia: 'cp' direto sobre um binario em execucao falha
    # com ETXTBSY e se interromper no meio, deixa o binario corrompido.
    tmp_bin="$BIN_DIR/.$BIN_NAME.new.$$"
    if ! cp "$extract_dir/$BIN_NAME" "$tmp_bin"; then
        rm -f "$tmp_bin"
        error "falha ao copiar o binario para $BIN_DIR"
    fi
    if ! chmod +x "$tmp_bin"; then
        rm -f "$tmp_bin"
        error "falha ao tornar o binario executavel em $BIN_DIR"
    fi
    if ! mv -f "$tmp_bin" "$BIN_DIR/$BIN_NAME"; then
        rm -f "$tmp_bin"
        error "falha ao instalar o binario em $BIN_DIR/$BIN_NAME"
    fi

    if ! mkdir -p "$DATA_DIR"; then
        error "falha ao criar diretorio de dados: $DATA_DIR"
    fi
    if ! cp "$extract_dir/LICENSE" "$extract_dir/README.md" "$DATA_DIR/" 2>/dev/null; then
        warn "nao foi possivel copiar LICENSE/README.md para $DATA_DIR"
    fi

    if [ "$OPT_SYSTEM" != "1" ]; then
        [ "$bin_dir_existed" -eq 0 ] && restore_ownership "$BIN_DIR"
        restore_ownership "$BIN_DIR/$BIN_NAME" "$DATA_DIR"
    fi

    log "MGC CLI instalado em $BIN_DIR/$BIN_NAME"
}

# ======================
# Integracao com o shell (PATH e autocomplete)
# ======================
add_export_in_terminal() {
    # Verifica se o diretório dos executáveis já está incluído no PATH.
    # Se estiver, retorna sucesso (0), indicando que os executáveis desse diretório
    # podem ser encontrados pelo Shell sem precisar informar o caminho completo.
    case ":$PATH:" in
        *":$BIN_DIR:"*) return 0 ;;
    esac

    [ -n "$TERMINAL" ] || { warn "Nao foi possivel detectar seu shell (suportado apenas bash e zsh); adicione manualmente ao PATH: export PATH=\"$BIN_DIR:\$PATH\""; return 0; }

    case "$TERMINAL" in
        bash) rc_file="$REAL_HOME/.bashrc" ;;
        zsh)  rc_file="$REAL_HOME/.zshrc" ;;
    esac

    export_line="export PATH=\"$BIN_DIR:\$PATH\""

    if grep -qF "$export_line" "$rc_file" 2>/dev/null; then
        return 0
    fi

    printf '\n%s\n' "$export_line" >> "$rc_file" \
        || error "falha ao adicionar $BIN_DIR ao PATH em $rc_file"
    restore_ownership "$rc_file"

    warn "PATH atualizado em $rc_file. Reinicie o terminal ou rode: source $rc_file"
}

add_completion_in_terminal() {
    [ -n "$TERMINAL" ] || { warn "Nao foi possivel detectar seu shell (suportado apenas bash e zsh); ative o autocomplete manualmente com: source <(mgc completion <bash|zsh>)"; return 0; }

    case "$TERMINAL" in
        bash) rc_file="$REAL_HOME/.bashrc" ;;
        zsh)  rc_file="$REAL_HOME/.zshrc" ;;
    esac

    completion_line="source <(mgc completion $TERMINAL)"

    if grep -qF "$completion_line" "$rc_file" 2>/dev/null; then
        return 0
    fi

    if [ "$TERMINAL" = "zsh" ] && ! grep -q "compinit" "$rc_file" 2>/dev/null; then
        printf '\n%s\n' "autoload -U compinit; compinit" >> "$rc_file" \
            || error "falha ao habilitar compinit em $rc_file"
    fi

    printf '\n%s\n' "$completion_line" >> "$rc_file" \
        || error "falha ao ativar autocomplete em $rc_file"
    restore_ownership "$rc_file"

    warn "Autocomplete ativado em $rc_file. Reinicie o terminal ou rode: source $rc_file"
}

# ======================
# Desinstalacao de versoes antigas
# ======================
data_dir_for_path() {
    p="$1"

    if [ "$p" = "/usr/local/bin/$BIN_NAME" ]; then
        printf '%s' "/usr/local/share/mgccli"
    elif [ "$p" = "$REAL_HOME/.local/bin/$BIN_NAME" ]; then
        printf '%s' "$REAL_HOME/.local/share/mgccli"
    else
        printf '%s' ""
    fi
}

uninstall_version() {
    path="$1"
    data_dir="$2"
    status=0

    rm -f "$path" && log "Removida instalacao antiga em $path" \
        || { warn "Foi encontrada outra instalacao do mgc em $path e não foi possível remove-la.
Essa instalação pode ter prioridade no PATH sobre $BIN_DIR/$BIN_NAME.
Remova o arquivo manualmente."; status=1; }

    if [ "$status" -eq 0 ] && [ -n "$data_dir" ] && [ "$data_dir" != "$DATA_DIR" ] && [ -d "$data_dir" ]; then
        rm -rf "$data_dir" && log "Removidos dados antigos em $data_dir" \
            || warn "Nao foi possivel remover os dados antigos em $data_dir. Remova manualmente se necessario."
    fi

    return $status
}

uninstall_iteration() {
    ITERATION_REMOVED=0
    i=0
    for path in $PREVIOUS_PATHS; do
        i=$((i + 1))
        [ "$path" = "$BIN_DIR/$BIN_NAME" ] && continue

        version=$(printf '%s\n' $PREVIOUS_VERSIONS | sed -n "${i}p")

        if [ "$version" = "$VERSION" ]; then
            continue
        fi

        data_dir=$(data_dir_for_path "$path")
        if uninstall_version "$path" "$data_dir"; then
            ITERATION_REMOVED=$((ITERATION_REMOVED + 1))
        fi
    done

    # Falhas de remocao ja foram reportadas via warn e nao devem abortar o script
    return 0
}

uninstall_old_versions() {
    uninstall_iteration

    while command -v "$BIN_NAME" >/dev/null 2>&1; do
        [ "$ITERATION_REMOVED" -eq 0 ] && break

        PREVIOUS_PATHS=""
        PREVIOUS_VERSIONS=""
        capture_previous_insallation
        uninstall_iteration
    done
}

# ======================
# Execucao principal
# ======================
main() {
    # Setup inicial
    setup_colors
    parse_args "$@"

    # Validacoes antes da instalacao
    detect_os
    detect_arch
    verify_dependencies
    previlege_check
    resolve_real_user
    resolve_install_dirs
    verify_terminal

    # Configuracao de download
    resolve_target_version
    capture_previous_insallation
    get_highest_installed_version
    is_downgrade
    setup_temp_dir
    build_filename
    build_installer_url
    build_checksum_url
    
    # Download
    download_instalation_file
    download_checksum_file

    # Verificacao - download
    verify_checksum
    
    # Instalacao
    install
    add_export_in_terminal
    add_completion_in_terminal

    # Desinstalação
    uninstall_old_versions
}


main "$@"

