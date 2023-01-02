#!/usr/bin/env bash
podman build --file ansible/Containerfile ansible --tag registry:5000/ansible