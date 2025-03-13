#!/bin/bash

echo "****************************************"
echo "Running SonarQube Analysis"
echo "****************************************"

WORKSPACE=/home/jenkins/jenkins-data/jenkins_home/workspace/pipeline-maven-app

# run SonarQube scanner from the container. Add the same network as the jenkins container assigned

docker run --rm --network jenkins-data_net -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app \
    maven:3.9.9-eclipse-temurin-23-alpine \
    mvn sonar:sonar \
    -Dsonar.projectKey=maven-sample-project \
    -Dsonar.host.url=http://sonarqube:9000 \
    -Dsonar.login=$SONAR_TOKEN

echo "****************************************"
echo "SonarQube Analysis Finished"
echo "****************************************"