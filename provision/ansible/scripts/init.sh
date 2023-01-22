#!/usr/bin/env bash
# This will generate a default ansible.cfg file
__THIS_PATH="$( cd -- "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 || exit ; pwd -P )"
__SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
__BASE_PATH="$( cd -- "${__SCRIPT_PATH}/../../.." >/dev/null 2>&1 || exit ; pwd -P )"
cd $__BASE_PATH/provision/ansible

CONFIG_FILE=ansible.cfg

are_you_sure() {
    read -p "Overwrite ${CONFIG_FILE}? [y/n] " RESPONSE
    [ "${RESPONSE}" != "n" ] && [ "${RESPONSE}" != "y" ] && are_you_sure
    [ "${RESPONSE}" != "y" ] && echo "Exiting" && exit 1
}

[ -f  ${CONFIG_FILE} ] && are_you_sure

podman run --rm -v${__BASE_PATH}:/localhost --env "ANSIBLE_CONFIG=/etc/ansible/ansible.cfg" ansible ansible-config init --disabled > ansible.cfg.in