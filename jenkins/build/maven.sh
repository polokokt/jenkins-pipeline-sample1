#!/bin/bash

echo "****************************************"
echo "Start Building Jar"
echo "****************************************"

# Setup workspace directory

WORKSPACE=/home/jenkins/jenkins-data/jenkins_home/workspace/pipeline-maven-app

# Compile the code, using docker image with maven. 

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3.9.9-eclipse-temurin-23-alpine "$@"

echo "***************************************"
echo "Finish Building Jar"
echo "***************************************"