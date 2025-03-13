#!/bin/bash

echo "***************************************"
echo "Testing the code"
echo "***************************************"

WORKSPACE=/home/jenkins/jenkins-data/jenkins_home/workspace/pipeline-maven-app

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3.9.9-eclipse-temurin-23-alpine "$@"