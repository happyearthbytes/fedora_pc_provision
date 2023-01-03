#!/usr/bin/env bash

kubectl get endpoints release-name-kubernetes-dashboard
echo release-name-kubernetes-dashboard
kubectl create token release-name-kubernetes-dashboard