#!/usr/bin/env bash
# NOTE: This file is automatically generated!
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ${SCRIPT_DIR}/..
CHART_SELECTOR=elastic
CHART_NAME=elasticsearch
CHART_URL=https://helm.elastic.co
./scripts/get_helm.sh \
  ${CHART_SELECTOR} \
  ${CHART_NAME} \
  ${CHART_URL}
