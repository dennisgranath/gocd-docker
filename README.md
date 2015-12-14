# docker-gocd

A containerized implementation of gocd.

## Developer Setup

### Prerequisites

1. `brew update`
2. `brew install docker-toolbox`

### Deployment

To start one server and one agent:

1. `docker-compose up`

If you want to scale up multiple agents (three in this example):

1. `docker-compose scale agent=3`
