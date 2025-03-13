#/bin/bash

DATE=$(date +%Y-%m-%d-%H-%M-%S)
BACKUP=db-$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_KEY=$4
BUCKET_NAME=$5

mysqldump -u mariadb_user -h $DB_HOST --ssl=0 -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=AKIA42P4M4GVSIJJO3FY && \
export AWS_SECRET_ACCESS_KEY=$AWS_KEY && \
echo "Uploading backup to aws s3" && \
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP
