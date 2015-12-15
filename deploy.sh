#!/bin/bash

username='andrewshawcare'
images='gocd-agent gocd-server-data'

for image in $images; do
  docker build --tag $username/$image ./$image && \
  docker push $username/$image
done
