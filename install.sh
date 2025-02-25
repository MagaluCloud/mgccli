#!/usr/bin/env bash

# error codes
# 0 - exited without problems
# 1 - parameters not supported were used or some unexpected error occurred
# 2 - OS not supported by this script
# 3 - installed version of mgc is up to date
# 4 - supported unzip tools are not available

set -e

#when adding a tool to the list make sure to also add its corresponding command further in the script
unzip_tools_list=('tar')
usage() { echo "Usage: sudo -v ; curl https://raw.githubusercontent.com/MagaluCloud/mgccli/main/install.sh | sudo bash " 1>&2; exit 1; }



#create tmp directory and move to it with macOS compatibility fallback
tmp_dir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mgc-install.XXXXXXXXXX')
cd "$tmp_dir"


#make sure unzip tool is available and choose one to work with
set +e
for tool in ${unzip_tools_list[*]}; do
    trash=$(hash "$tool" 2>>errors)
    if [ "$?" -eq 0 ]; then
        unzip_tool="$tool"
        break
    fi
done  
set -e

# exit if no unzip tools available
if [ -z "$unzip_tool" ]; then
    printf "\nNone of the supported tools for extracting zip archives (${unzip_tools_list[*]}) were found. "
    printf "Please install one of them and try again.\n\n"
    exit 4
fi

# Make sure we don't create a root owned .config/mgc directory #2127
export XDG_CONFIG_HOME=config

current_version=$(curl -L https://github.com/MagaluCloud/mgccli/releases/latest | grep -o '<title>[^<]*</title>' | sed -e 's/<\/\?title>//g' | grep -o 'v[0-9]*\.[0-9]*\.[0-9]*' | sed -e 's/v//')
local_version=$(mgc --version | grep -o 'v[0-9]*\.[0-9]*\.[0-9]*' | sed -e 's/v//')

if [ "$local_version" = "$current_version" ]; then
    printf "\nThe latest version of mgc is already installed.\n\n"
    exit 3
fi
#detect the platform
OS="$(uname)"
case $OS in
  Linux)
    OS='linux'
    ;;
  FreeBSD)
    OS='freebsd'
    ;;
  NetBSD)
    OS='netbsd'
    ;;
  OpenBSD)
    OS='openbsd'
    ;;  
  Darwin)
    OS='osx'
    binTgtDir=/usr/local/bin
    man1TgtDir=/usr/local/share/man/man1
    ;;
  *)
    echo 'OS not supported'
    exit 2
    ;;
esac

OS_type="$(uname -m)"
case "$OS_type" in
  x86_64|amd64)
    OS_type='amd64'
    ;;
  aarch64|arm64)
    OS_type='arm64'
    ;;
  *)
    echo 'OS type not supported'
    exit 2
    ;;
esac


#download and unzip
download_link="https://github.com/MagaluCloud/mgccli/releases/download/v${current_version}/mgccli_${current_version}_${OS}_${OS_type}.tar.gz"
echo $download_link
mgc_zip="mgccli_${current_version}_${OS}_${OS_type}.tar.gz"

wget "$download_link"
unzip_dir="tmp_unzip_dir_for_mgc"
mkdir $unzip_dir
# there should be an entry in this switch for each element of unzip_tools_list
tar -xvf "$mgc_zip" -C "$unzip_dir"

cd $unzip_dir/

#mounting mgc to environment

case "$OS" in
  'linux')
    #binary
    cp mgc /usr/bin/mgc.new
    chmod 755 /usr/bin/mgc.new
    chown root:root /usr/bin/mgc.new
    mv /usr/bin/mgc.new /usr/bin/mgc
    ;;
  'freebsd'|'openbsd'|'netbsd')
    #binary
    cp mgc /usr/bin/mgc.new
    chown root:wheel /usr/bin/mgc.new
    mv /usr/bin/mgc.new /usr/bin/mgc
    #manual
    mkdir -p /usr/local/man/man1
    cp mgc.1 /usr/local/man/man1/
    makewhatis
    ;;
  *)
    echo 'OS not supported'
    exit 2
esac

#update version variable post install
version=$(mgc --version 2>>errors | head -n 1)

#cleanup
rm -rf "$tmp_dir"

printf "\n${version} has successfully installed."
printf '\nNow run "mgc config" for setup. Check https://docs.magalu.cloud/docs/cli-mgc/how-to/auth for more details.\n\n'
exit 0
