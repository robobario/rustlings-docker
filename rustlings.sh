#!/bin/bash
docker run --rm -it -u "$(id -u):$(id -g)" -v "$PWD":/opt/rustlings robobario/rustlings-docker "$@"
