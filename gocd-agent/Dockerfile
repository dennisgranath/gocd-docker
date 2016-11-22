FROM gocd/gocd-agent:latest
RUN apt-get update && apt-get install -y maven ansible \
    && set -ex \
    && mkdir /opt/java \
    && curl -L -H "Cookie: oraclelicense=accept-securebackup-cookie" \
        -o /opt/java/jdk.tar.gz \
        http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz \
    && tar -xzf /opt/java/jdk.tar.gz -C /opt/java/ \
    && mv /opt/java/jdk[0-9].* /opt/java/jdk \
    && mkdir /var/go/.ssh \
    && curl -L -o /var/go/.ssh/id_rsa \
       https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant \
    && chmod 600 /var/go/.ssh/id_rsa \
    && chown -R go:go /var/go/.ssh \
    && curl -L -o /bin/gocd-plumber https://github.com/dennisgranath/gocd-plumber/releases/download/v0.12.0/gocd-plumber-0.12.0-linux-amd64 \
    && chmod +x /bin/gocd-plumber

ENV JAVA_HOME=/opt/java/jdk
ENV PATH=$PATH:JAVA_HOME/bin
