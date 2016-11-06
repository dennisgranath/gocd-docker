FROM openjdk:8

RUN mkdir /root/.ssh \
  && curl -L -o /root/.ssh/authorized_keys \
   https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub \
  && apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
