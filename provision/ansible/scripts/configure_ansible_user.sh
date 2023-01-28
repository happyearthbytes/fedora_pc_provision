#!/usr/bin/env bash
_ROOT="../../.." _COMMON="scripts/libs/bash/common/common.sh"
. $( cd -- "$(dirname "${BASH_SOURCE[0]}")/${_ROOT}" >/dev/null 2>&1 || exit ; pwd -P )/${_COMMON}

[ $(podman secret inspect sshpubkey > /dev/null 2>&1 ; echo $?) == "0" ] || podman secret create sshpubkey ~/.ssh/id_rsa.pub
[ $(podman secret inspect sshkey > /dev/null 2>&1 ; echo $?) == "0" ] || podman secret create sshkey ~/.ssh/id_rsa

podman run -it --rm \
  -v${__BASE_PATH}:/localhost \
  --network host \
  --userns=keep-id \
  --secret sshpubkey,target=/ssh/id_rsa.pub,mode=0600,uid=$(id -u) \
  --secret sshkey,target=/ssh/id_rsa,mode=0600,uid=$(id -u) \
  --env ANSIBLE_CONFIG="/localhost/provision/ansible/ansible.cfg" \
  ansible ansible-playbook \
  --user ${USER}\
  --ask-become-pass \
  /localhost/provision/ansible/playbooks/bootstrap.yaml

[ $(podman secret inspect sshpubkey > /dev/null; echo $?) != "0" ] || podman secret rm sshpubkey > /dev/null
[ $(podman secret inspect sshkey > /dev/null; echo $?) != "0" ] || podman secret rm sshkey > /dev/null