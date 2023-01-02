#!/usr/bin/env bash
# This will generate a default ansible.cfg file
__THIS_PATH="$( cd -- "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 || exit ; pwd -P )"
__SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
__BASE_PATH="$( cd -- "${__SCRIPT_PATH}/../.." >/dev/null 2>&1 || exit ; pwd -P )"
cd $__BASE_PATH/ansible
podman run -it --rm -v${__BASE_PATH}:/localhost ansible ansible-config init --disabled > ansible.cfg.init
cp ansible.cfg.init ansible.in.cfg