#!/usr/bin/env bash
# NOTE: This file is automatically generated!
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ${SCRIPT_DIR}/..
CHART_SELECTOR=grafana
CHART_NAME=grafana
CHART_URL=https://grafana.github.io/helm-charts
./scripts/get_helm.sh \
  ${CHART_SELECTOR} \
  ${CHART_NAME} \
  ${CHART_URL}