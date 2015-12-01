#!/usr/bin/env bash
set -e

DOCKER_SOCKET_GROUP=$(ls -l /var/run/docker.sock | awk '{print $4}')
usermod --append --groups "$DOCKER_SOCKET_GROUP" go
