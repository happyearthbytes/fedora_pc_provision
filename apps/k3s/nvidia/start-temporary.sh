#!/usr/bin/env bash
kubectl apply -f nvidia-namespace.yaml
kubectl apply -f nvidia-device-plugin.yaml
# kubectl apply -f nvidia-config.yaml
