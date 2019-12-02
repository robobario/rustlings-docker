#!/bin/bash
cd "$( dirname "${BASH_SOURCE[0]}" )"
if [[ "$(docker images -q rustlings-local 2> /dev/null)" == "" ]]; then
  docker build . -t rustlings-local
fi
docker run --rm -it -u "$(id -u):$(id -g)" -v "$PWD":/opt/rustlings rustlings-local "$@"
