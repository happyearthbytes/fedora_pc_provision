#!/usr/bin/env bash
_ROOT="../.." _COMMON="scripts/libs/bash/common/common.sh"
. $( cd -- "$(dirname "${BASH_SOURCE[0]}")/${_ROOT}" >/dev/null 2>&1 || exit ; pwd -P )/${_COMMON}
cd ${__BASE_PATH}
__print_header

MOUNT_DIR="/localhost"

podman run --rm \
  -v${__BASE_PATH}:${MOUNT_DIR} \
  --network host \
  --userns=keep-id \
  plantuml/plantuml \
  -o ${MOUNT_DIR}/build \
  -tpng \
  "${MOUNT_DIR}/docs/plant_uml/**/*.pu"