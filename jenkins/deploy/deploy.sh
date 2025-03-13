#!/bin/bash

echo "***********************"
echo "*** Deploying app ***"
echo "***********************"

echo maven-sample-project > /tmp/.auth
echo $BUILD_ID >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /home/jenkins/prod /tmp/.auth prod-user@192.168.100.134:/tmp/.auth
scp -i /home/jenkins/prod ./jenkins/deploy/publish.sh prod-user@192.168.100.134:/tmp/publish.sh

ssh -i /home/jenkins/prod prod-user@192.168.100.134 "chmod +x /tmp/publish.sh && /tmp/publish.sh"