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
3. `ruby lib/boot2docker-nfs.rb dev`

### Docker Compose

1. `docker-compose up`
