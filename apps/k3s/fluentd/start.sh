#!/usr/bin/env bash
_ROOT="../../.." _COMMON="scripts/libs/bash/common/common.sh"
. $( cd -- "$(dirname "${BASH_SOURCE[0]}")/${_ROOT}" >/dev/null 2>&1 || exit ; pwd -P )/${_COMMON}
__THIS_PATH="$( cd -- "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit ; pwd -P )"
__print_header
__run_section ${__THIS_PATH}/generate.sh
__run_section kubectl apply ${__THIS_PATH}/namespace.yaml
__run_section kubectl apply --namespace fluentd -k ${__THIS_PATH}

