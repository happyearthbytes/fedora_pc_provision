#!/usr/bin/env bash
_ROOT="../../.." _COMMON="scripts/libs/bash/common/common.sh"
. $( cd -- "$(dirname "${BASH_SOURCE[0]}")/${_ROOT}" >/dev/null 2>&1 || exit ; pwd -P )/${_COMMON}
find ${__BASE_PATH}/apps/k3s \( -name 'base' -o -name 'charts' \) -maxdepth 2 -type d -exec echo rm -rf {} \;
