#!/usr/bin/env bash
_ROOT="../../.." _COMMON="scripts/libs/bash/common/common.sh"
. $( cd -- "$(dirname "${BASH_SOURCE[0]}")/${_ROOT}" >/dev/null 2>&1 || exit ; pwd -P )/${_COMMON}
__print_header
__run_section k3s-killall.sh
__run_section sudo systemctl stop k3s
__run_section sudo systemctl status k3s --no-pager || true