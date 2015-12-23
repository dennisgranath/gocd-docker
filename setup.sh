#!/usr/bin/env bash

# Create docker volumes
docker volume create --name var_lib_go-server_addons
docker volume create --name var_log_go-server
docker volume create --name etc_go
docker volume create --name go-addons
docker volume create --name var_go

export DOCKER_BINARY=$(which docker)
