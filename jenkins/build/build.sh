#!/bin/bash

# Copy the jar file to the build location
echo "*** start build.sh***"
cp -f java-app/target/*.jar jenkins/build/

echo "***********************************"
echo "*** Building docker image ***"
echo "***********************************"

#Build docker image with java app

cd jenkins/build/ && docker compose -f docker-compose-build.yaml build --no-cache

echo "*** finish build.sh***"


