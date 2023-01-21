#!/usr/bin/env bash
_ROOT="../../.." _COMMON="scripts/libs/bash/common/common.sh"
. $( cd -- "$(dirname "${BASH_SOURCE[0]}")/${_ROOT}" >/dev/null 2>&1 || exit ; pwd -P )/${_COMMON}

[ $(podman secret inspect sshkey > /dev/null; echo $?) == "0" ] || podman secret create sshkey ~/.ssh/id_rsa

podman run -it --rm \
  -v${__BASE_PATH}:/localhost \
  --network host \
  --userns=keep-id \
  --secret sshkey,target=/ssh/id_rsa,mode=0600,uid=1000 \
  --env ANSIBLE_CONFIG="/localhost/provision/ansible/ansible.cfg" \
  ansible ansible-playbook \
  -i /localhost/provision/ansible/inventories/production/hosts.yaml \
  --user ${USER}\
  --ask-become-pass \
  /localhost/provision/ansible/playbooks/bootstrap.yaml