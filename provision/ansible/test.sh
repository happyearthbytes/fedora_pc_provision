#!/usr/bin/env bash
podman run -it --rm -v${PWD}:/localhost ansible sh
# podman run -it --rm -v${PWD}:/localhost ansible ansible --help
podman run -it --rm -v${PWD}:/localhost ansible ansible --help