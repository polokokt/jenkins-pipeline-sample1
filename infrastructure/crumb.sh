#!/bin/bash

crumb=$(curl -u "jenkins:1234" -s 'http://127.0.0.1:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
#curl -u "jenkins:1234" -H "$crumb" -X POST http://127.0.0.1:8080/job/Print_env_variables/build?delay=0sec
curl -u "jenkins:1234" -H "$crumb" -X POST  http://127.0.0.1:8080/job/backup_db_to_s3/buildWithParameters?SQL_DB_HOST=mysql-srv&SQL_DB_NAME=testdb&S3_BUCKET_NAME=jenkins-mysql-backup-rs