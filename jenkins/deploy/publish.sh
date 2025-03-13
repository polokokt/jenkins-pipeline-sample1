#!/bin/bash

# grab information passed by .auth file
export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)

docker login -u $DOCKER_CREDS_USR -p $DOCKER_CREDS_PSW

# run docker compose file from the home directory of the user. Attached as docker-compose-remote.yaml
docker compose up -d