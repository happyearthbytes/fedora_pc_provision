#!/usr/bin/env bash
__THIS_PATH="$( cd -- "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 || exit ; pwd -P )"
__SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
__BASE_PATH="$( cd -- "${__SCRIPT_PATH}/../../.." >/dev/null 2>&1 || exit ; pwd -P )"
cd $__BASE_PATH/provision/ansible

podman build --file Containerfile . --tag registry:5000/ansible