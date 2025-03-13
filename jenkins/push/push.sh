#!/bin/bash

echo "*****************************"
echo "*** Pushing image ***"
echo "*****************************"

# push docker image with new version of app, to the Docker Hub repository
IMAGE="maven-sample-project"

docker login -u $DOCKER_CREDS_USR -p $DOCKER_CREDS_PSW
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_ID $DOCKER_CREDS_USR/$IMAGE:$BUILD_ID

echo "*** Pushing image ***"
docker push $DOCKER_CREDS_USR/$IMAGE:$BUILD_ID