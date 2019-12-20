#!/bin/sh

echo "snd-aloop" >> /etc/modules
modprobe snd-aloop

#docker build -t jitsi2 . && \
docker build -t jibri2 .  && \
#docker-compose -f docker-compose.yaml up -d
docker-compose -f my-docker-compose.yaml up -d