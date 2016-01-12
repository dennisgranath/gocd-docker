# docker-gocd

A dockerized implementation of gocd using using docker-enabled agents

## Developer Setup

### Prerequisites

1. `brew update`
2. `brew install docker-toolbox`
3. `eval $(cat setup.sh)` (or see details below)

### Volumes

In order to use volumes correctly on OSX, named volumes must be created using the following commands:

```
docker volume create --name var_lib_go-server_addons
docker volume create --name var_log_go-server
docker volume create --name etc_go
docker volume create --name go-addons
docker volume create --name var_go
```

### Environment Variables

`DOCKER_BINARY` should be the path to the docker binary on your host machine. For example:

`export DOCKER_BINARY=$(which docker)`

### Deployment

To start one server and one agent:

1. `docker-compose up`

If you want to scale up multiple go-agents (three in this example):

1. `docker-compose scale gocd-agent=3`
