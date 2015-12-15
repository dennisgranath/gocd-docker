FROM phusion/baseimage:0.9.16

RUN groupadd --system go
RUN useradd --system --gid go go

RUN mkdir -p /var/lib/go-server/addons /var/log/go-server /etc/go /go-addons /var/go
RUN touch /etc/go/postgresqldb.properties
COPY ./cruise-config.xml /etc/go/

RUN chown -R go:go /var/lib/go-server/addons /var/log/go-server /etc/go /go-addons /var/go
VOLUME /var/lib/go-server/addons /var/log/go-server /etc/go /go-addons /var/go

COPY ./change-volume-ownership.sh /etc/my_init.d/
