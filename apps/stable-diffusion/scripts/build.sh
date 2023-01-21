#!/usr/bin/env bash
# podman build -f Containerfile.auto-ui-download . -t registry:5000/stable-diffusion-download:latest
podman build -f Containerfile.auto-ui-install . -t registry:5000/stable-diffusion-install:latest
podman build -f Containerfile.auto-ui . -t registry:5000/stable-diffusion-ui:latest
podman push registry:5000/stable-diffusion-ui:latest