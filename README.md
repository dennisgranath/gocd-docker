# gocd-docker

A dockerized implementation of gocd using using docker-enabled agents

## Deployment

### Prerequisites

This project is deployed with Docker. The easiest way to setup a Docker environment is by installing the [Docker Toolbox](https://www.docker.com/docker-toolbox).

### Docker Compose

1. `. setup.sh`
2. `docker-compose up`

If you want to scale agents (three in this example):

1. `docker-compose scale gocd-agent=3`
