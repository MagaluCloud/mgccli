## Magalu Cloud CLI

O MGC CLI (Command Line Interface) é uma ferramenta que permite aos usuários interagirem com os serviços da Magalu Cloud (MGC) por meio de linha de comando. Ela está disponível para os sistema macOS, Linux e Windows nas arquiteturas AMD64 e ARM.

Pela CLI você pode adminstrar

- Object Storage (buckets, objetos, ACL, versões, URL assinada)
- Virtual Machines (instâncias, snapshots)
- DBaaS (instâncias, replicações)
- Block Storage (volumes, associações com VMs)
- VPC (sub-redes, regras de segurança, IP público)
- Cluster Kubernetes (criar, escalar, monitorar)

A CLI também permite a criação de perfis para melhor separar suas configurações e *tenants*.

## Como contribuir?

Atualmente este repositório abriga apenas os builds/releases da CLI. O código-fonte se encontra em nosso [monorepo](https://github.com/MagaluCloud/magalu) e e contribuições de código devem ser feitas por lá. A migração do código para este repo está nos planos.

## Pré-Requisitos

Para utilizar a CLI você precisa já ter criado uma conta na Magalu Cloud através do [Console Magalu Cloud](https://console.magalu.cloud).

Uma vez tendo criado a sua conta, basta seguir o procedimento de download e instalação para o seus sistema.

## Download e Instalação

Baixe a *release* correta para seu sistema e arquitetura no link abaixo.

[Releases](https://github.com/MagaluCloud/mgccli/releases/)

### Linux

#### **Debian / Ubuntu**

Para instalar a CLI apartir do pacote deb, basta executar o comando abaixo em um terminal dentro do diretório onde está o pacote. Atualize o nome do arquivo .deb de acordo com aquele que você baixou.

```
sudo dpkg -i mgccli_x.xx.x_linux_amd64.deb
```

#### **Fedora / CentOS**

Para instalar a CLI apartir do pacote rpm, basta executar o comando abaixo no mesmo diretório onde está o pacote. Atualize o nome do arquivo .rpm de acordo com aquele que você baixou.

```
sudo rpm -i mgccli_x.xx.x_linux_amd64.rpm
```

#### **Arquivo tar.gz**

Abra um terminal e execute o seguinte comando para criar um diretório dedicado a CLI na sua home de usuário.

```
mkdir ~/mgc_cli
```

Execute o comando abaixo na mesma pasta onde está o arquivo .tar.gz. Atualize o nome do arquivo de acordo com aquele que você baixou.

```
tar -xvf mgccli_x.xx.x_linux_amd64.tar.gz -C ~/mgc_cli
```

Para melhor experiência com a CLI, recomendamos que o diretório de instalação seja adicionado na variável PATH. Rode o comando abaixo e depois adicione essa linha ao arquivo **~/.bashrc** ou **~/.zshrc** dependendo do seu shell.

```
export PATH=$HOME/mgc_cli:$PATH
```

### MacOS

#### **Homebrew**

Para instalar a CLI utilizar a ferramenta brew, você precisa ter certeza de que ela está corretamente instalada no seu sistema. Visite o site oficial: [https://brew.sh/](https://brew.sh/)

Depois abra um terminal e execute o comando tap no nosso repositório oficial:

```
brew tap MagaluCloud/homebrew-mgccli
```

e por final execute o comando de instalação:

```
brew install mgccli
```

#### **Arquivo tar.gz**

A CLI possui arquivos de instalação separados para cada arquitetura. Baixe o arquivo correspondente a sua arquitetura no repositório oficial.

[https://github.com/MagaluCloud/mgccli/releases/](https://github.com/MagaluCloud/mgccli/releases/)

Tenha certeza de que seu usuário possui permissão sudo.

Abra um terminal e execute o seguinte comando para criar um diretório dedicado a CLI na sua home de usuário.

```
mkdir ~/mgc_cli
```

Execute o comando abaixo no mesmo diretório onde está o arquivo .tar.gz. Atualize o nome do arquivo de acordo com aquele que você baixou.

```
tar -xvf mgc_0.18.3_linux_amd64.tar.gz -C ~/mgc_cli
```

Para melhor experiência com a CLI, recomendamos que o diretório de instalação seja adicionado na variável PATH. Rode o comando abaixo e depois adicione essa linha ao arquivo **~/.bashrc** ou **~/.zshrc** dependendo do seu shell.

```
export PATH=$HOME/mgc_cli:$PATH
```

### Windows

A CLI possui arquivos de instalação separados para cada arquitetura. Baixe o arquivo correspondente a sua arquitetura (amd64 / arm) no repositório oficial.

Para instalar a CLI no seu sistema Windows 10/11 siga os passos abaixo.

1. Extraia o conteúdo do arquivo ZIP para uma pasta de sua preferência.
    
2. Abra um Prompt de Comando ou terminal Powershell na pasta onde você extraiu os arquivos.
    
3. Rode o comando abaixo para confirmar a instalação:
    
    ```
    mgc --version
    ```

## Autenticação

Para fazer a autenticação na CLI e ter sua credencial armazenada no arquivo de configuração, você precisa rodar o seguinte comando:

```
mgc auth login
```

Este comando abrirá uma janela do seu navegador padrão diretamente no site do ID Magalu, onde você deverá fazer seu login. Ao terminar o procedimento e fechar o navegador, a CLI exibirá a confirmação e seu token de acesso será salvo no arquivo abaixo.

```
$HOME/.config/mgc/<PERFIL>/auth.yaml
```

Onde <PERFIL> é o nome do perfil que você deseja configurar.

Se você precisar do token de acesso para usar com a API da Magalu Cloud, você adquirir também rodando o comando abaixo.

```
mgc auth access-token
```
