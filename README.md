# gocd

## Developer Setup

### Prerequisites

1. `brew update`
2. `brew install docker`
3. `brew install docker-machine`
4. `brew install docker-compose`

### Docker Machine

1. `docker-machine create --driver virtualbox --virtualbox-cpu-count 2 --virtualbox-memory 2048 dev`
2. `eval “$(docker-machine env dev)”`
3. `ruby <(curl -L https://git.io/vvvco) dev`

### Docker Compose

To start one server and one agent:

1. `docker-compose up`

If you want to scale up multiple agents (three in this example):

1. `docker-compose scale agent=3`
