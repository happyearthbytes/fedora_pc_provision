#!/usr/bin/env bash
_ROOT="../../.." _COMMON="scripts/libs/bash/common/common.sh"
. $( cd -- "$(dirname "${BASH_SOURCE[0]}")/${_ROOT}" >/dev/null 2>&1 || exit ; pwd -P )/${_COMMON}
__print_header
cd ${__BASE_PATH}/apps/stable-diffusion
# podman build -f containerfiles/Containerfile.auto-ui-download . -t registry:5000/stable-diffusion-download:latest
podman build -f containerfiles/Containerfile.auto-ui-install . -t registry:5000/stable-diffusion-install:latest
podman push registry:5000/stable-diffusion-install:latest
podman build -f containerfiles/Containerfile.auto-ui . -t registry:5000/stable-diffusion-ui:latest
# podman push registry:5000/stable-diffusion-ui:latest
