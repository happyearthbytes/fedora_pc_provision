#!/usr/bin/env bash
# This will generate a default ansible.cfg file
__THIS_PATH="$( cd -- "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 || exit ; pwd -P )"
__SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
__BASE_PATH="$( cd -- "${__SCRIPT_PATH}/../../.." >/dev/null 2>&1 || exit ; pwd -P )"
cd $__BASE_PATH/provision/ansible
echo "# This file is automatically generated, modify ansible.cfg.in instead" > ansible.cfg
sed -e '/^#/d' -e '/^$/d' -e '/^;/d' ansible.cfg.in >> ansible.cfg