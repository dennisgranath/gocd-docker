#!/usr/bin/env bash
set -e

docker_socket_group=$(ls -l /var/run/docker.sock | awk '{print $4}')

if [[ $docker_socket_group =~ ^[0-9]+$ ]]; then
  groupadd --gid $docker_socket_group docker
  docker_socket_group=docker
fi

usermod --append --groups "$docker_socket_group" go
