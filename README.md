# DevOps Jenkins Pipeline Demo

This repository contains a fully automated CI/CD pipeline using Jenkins, Docker, SonarQube, and GitLab.

📌 Prerequisites

Before running the pipeline, you need to place a sample Java application in the `./build/java-app` directory.

📂 Project Structure

`jenkins/` – Contains all scripts used in the Jenkinsfile, executed during each stage of the pipeline.
`infrastructure/` – Contains the docker-compose.yaml file, required to set up the necessary containers for this pipeline. 

## Features
✅ Java application built with Maven  
✅ CI/CD pipeline using Jenkins  
✅ Dockerized SonarQube for static code analysis  
✅ Push Docker images to DockerHub  
✅ Deploy container on a remote host 


![Jenkins_pipeline](./images/Jenkins.jpg)