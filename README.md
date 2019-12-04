# rustlings docker

Dockerised (rustlings)[https://github.com/rust-lang/rustlings] so you can play with rustlings without installing a rust toolchain

## shell script for bash

``` bash
mkdir rustlings
cd rustlings
curl -O https://raw.githubusercontent.com/robobario/rustlings-docker/master/rustlings.sh
chmod +x rustlings.sh
./rustlings.sh verify
```

## raw docker

``` bash
mkdir rustlings
cd rustlings
docker run --rm -it -u "$(id -u):$(id -g)" -v "$PWD":/opt/rustlings robobario/rustlings-docker verify
```
