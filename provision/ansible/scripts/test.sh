#!/usr/bin/env bash
# This will generate a default ansible.cfg file
__THIS_PATH="$( cd -- "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 || exit ; pwd -P )"
__SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
__BASE_PATH="$( cd -- "${__SCRIPT_PATH}/../.." >/dev/null 2>&1 || exit ; pwd -P )"
cd $__BASE_PATH/ansible
# podman run --rm -v${__BASE_PATH}:/localhost ansible ansible-config dump --config /localhost/ansible/ansible.in.cfg > ansible.cfg
# podman run -it --rm -v${__BASE_PATH}:/localhost ansible ansible-config dump --config /localhost/ansible/ansible.in.cfg
podman run -it --rm -v${__BASE_PATH}:/localhost ansible sh