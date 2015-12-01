# docker-gocd

A containerized implementation of gocd.

## Developer Setup

### Prerequisites

1. `brew update`
2. `brew install docker-toolbox`

### Environment Varialbles

`DOCKER_BINARY` should be the path to the docker binary on your host machine. For example:

`export DOCKER_BINARY=$(which docker)`

### Deployment

To start one server and one agent:

1. `docker-compose up`

If you want to scale up multiple agents (three in this example):

1. `docker-compose scale agent=3`
