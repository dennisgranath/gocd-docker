FROM gocd/gocd-agent
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -aG docker go
RUN mkdir /etc/service/docker
COPY ./run /etc/service/docker/run
RUN chmod +x /etc/service/docker/run
