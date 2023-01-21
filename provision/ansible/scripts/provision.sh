#!/usr/bin/env bash
__THIS_PATH="$( cd -- "$(dirname "${BASH_SOURCE}")" >/dev/null 2>&1 || exit ; pwd -P )"
__SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
__BASE_PATH="$( cd -- "${__SCRIPT_PATH}/../.." >/dev/null 2>&1 || exit ; pwd -P )"
cd ${__BASE_PATH}/provision/ansible

[ $(podman secret inspect sshkey > /dev/null; echo $?) == "0" ] || podman secret create sshkey ~/.ssh/id_rsa
[ $(podman secret inspect ansiblekey > /dev/null; echo $?) == "0" ] || sudo cat /home/ansible/.ssh/id_rsa | podman secret create ansiblekey -

podman run -it --rm \
  -v${__BASE_PATH}:/localhost \
  --network host \
  --userns=keep-id \
  --secret sshkey,target=/ssh/id_rsa,mode=0600,uid=1000 \
  --secret ansiblekey,target=/ansible_ssh/id_rsa,mode=0600,uid=1000 \
  ansible ansible-playbook \
  -i /localhost/provision/ansible/inventories/production/hosts.yaml \
  --user ${USER} \
  --become-user=ansible \
  /localhost/provision/ansible/playbooks/provision.yaml