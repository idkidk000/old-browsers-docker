#!/usr/bin/env bash

declare -r IMAGE_NAME='old-browsers:latest'

# build
docker build --tag "$IMAGE_NAME" --progress plain .
# give `docker` user x11 (dw, still works under wayland through x11 compat) permissions to access the xserver
xhost +local:docker
# run with an interactive shell and host networking so localhost works
docker run \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --rm \
  --net=host \
  --shm-size=1gb \
  -it "$IMAGE_NAME"
# remove permission
xhost -local:docker
