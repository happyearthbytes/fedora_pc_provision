#!/usr/bin/env bash
# This will generate a default ansible.cfg file
__THIS_PATH="$( cd -- "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 || exit ; pwd -P )"
__SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
__BASE_PATH="$( cd -- "${__SCRIPT_PATH}/../../.." >/dev/null 2>&1 || exit ; pwd -P )"
cd $__BASE_PATH/provision/ansible

[ $(podman secret inspect sshpubkey > /dev/null 2>&1 ; echo $?) == "0" ] || sudo cat /home/ansible/.ssh/id_rsa.pub | podman secret create sshpubkey -  > /dev/null
[ $(podman secret inspect sshkey > /dev/null 2>&1 ; echo $?) == "0" ] || sudo cat /home/ansible/.ssh/id_rsa | podman secret create sshkey - > /dev/null

podman run -it --rm \
  -v${__BASE_PATH}:/localhost \
  --network host \
  --userns=keep-id \
  --secret sshpubkey,target=/ssh/id_rsa.pub,mode=0600,uid=$(id -u) \
  --secret sshkey,target=/ssh/id_rsa,mode=0600,uid=$(id -u) \
  --env ANSIBLE_CONFIG="/localhost/provision/ansible/ansible.cfg" \
  ansible sh

[ $(podman secret inspect sshpubkey > /dev/null; echo $?) != "0" ] || podman secret rm sshpubkey > /dev/null
[ $(podman secret inspect sshkey > /dev/null; echo $?) != "0" ] || podman secret rm sshkey > /dev/null