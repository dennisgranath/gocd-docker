#!/usr/bin/env bash
set -e

DOCKER_SOCKET_GROUP=$(ls -l /var/run/docker.sock | awk '{print $4}')

if [[ $DOCKER_SOCKET_GROUP =~ ^[0-9]+$ ]]; then
  groupadd --gid $DOCKER_SOCKET_GROUP docker
  DOCKER_SOCKET_GROUP=docker
fi

usermod --append --groups "$DOCKER_SOCKET_GROUP" go
