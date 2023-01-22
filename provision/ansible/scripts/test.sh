#!/usr/bin/env bash
# This will generate a default ansible.cfg file
__THIS_PATH="$( cd -- "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 || exit ; pwd -P )"
__SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
__BASE_PATH="$( cd -- "${__SCRIPT_PATH}/../../.." >/dev/null 2>&1 || exit ; pwd -P )"
cd $__BASE_PATH/provision/ansible

[ $(podman secret inspect sshkey > /dev/null; echo $?) == "0" ] || podman secret create sshkey ~/.ssh/id_rsa

podman run -it --rm \
  -v${__BASE_PATH}:/localhost \
  --userns=keep-id \
  --secret sshkey,target=/ssh/id_rsa,mode=0600,uid=1000 \
  ansible sh
