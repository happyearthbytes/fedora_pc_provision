#!/usr/bin/env bash
__THIS_PATH="$( cd -- "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 || exit ; pwd -P )"
__SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
__BASE_PATH="$( cd -- "${__SCRIPT_PATH}/../.." >/dev/null 2>&1 || exit ; pwd -P )"
cd $__BASE_PATH/ansible

podman secret create sshkey ~/.ssh/id_rsa

podman run -it --rm \
  -v${__BASE_PATH}:/localhost \
  --userns=keep-id \
  --secret sshkey,target=/ssh/id_rsa,mode=0600,uid=1000 \
  ansible ansible-playbook \
  -i /localhost/ansible/inventories/production/hosts.yaml \
  --user ${USER}\
  --become-user ${USER}\
  /localhost/ansible/site.yml


# -v ~/.ssh:/ssh:z
# podman secret create sshkey ~/.ssh/id_rsa
# --secret sshkey,target=/ssh/id_rsa,mode=0600