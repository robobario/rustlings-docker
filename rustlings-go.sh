#!/bin/bash
if [ ! -d ~/rustlings-docker/ ]; then
  git clone https://github.com/robobario/rustlings-docker.git ~/rustlings-docker
fi
cd ~/rustlings-docker
exec ./rustlings.sh $@
