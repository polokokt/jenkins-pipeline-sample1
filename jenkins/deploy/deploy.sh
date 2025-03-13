#!/bin/bash

echo "***********************"
echo "*** Deploying app ***"
echo "***********************"

# Prepare credentials and additional information, to sent to the remote host

echo maven-sample-project > /tmp/.auth
echo $BUILD_ID >> /tmp/.auth
echo $PASS >> /tmp/.auth

# copy .auth file to the remote host

scp -i /home/jenkins/prod /tmp/.auth prod-user@192.168.100.134:/tmp/.auth

# copy and run publish script, which 
scp -i /home/jenkins/prod ./jenkins/deploy/publish.sh prod-user@192.168.100.134:/tmp/publish.sh

ssh -i /home/jenkins/prod prod-user@192.168.100.134 "chmod +x /tmp/publish.sh && /tmp/publish.sh"