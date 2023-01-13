#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ${SCRIPT_DIR}/..

packages=${SCRIPT_DIR}/packages.txt
external=${SCRIPT_DIR}/external_installs.sh
extra_setup=${SCRIPT_DIR}/extra_setup.sh

print_install() {
    echo "# ==============================================================================="
    echo "# Installing: $1"
    echo "# ==============================================================================="
}

print_install "standard packages"
sudo dnf install -y $(cat $packages | tr '\n' ' ')
print_install "external packages"
${external}
print_install "extra setup"
${extra_setup}