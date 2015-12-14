FROM gocd/gocd-agent

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-engine

COPY ./add-go-user-to-docker-socket-group.sh /etc/my_init.d/
