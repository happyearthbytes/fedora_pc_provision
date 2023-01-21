#!/usr/bin/env bash
podman build -f containerfiles/Containerfile.download . --format docker -t registry:5000/stable-diffusion-download:latest
mkdir -p build/download
podman run -v ${PWD}/data:/data -it registry:5000/stable-diffusion-download:latest