#!/usr/bin/env bash
set -e

groupadd --force docker
chgrp docker /var/run/docker.sock
usermod --append --groups docker go
