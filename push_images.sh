#!/bin/bash

aws_region=$1
app_name=$2
version="1.0"

date=$(date -u %Y%m%d)
aws_account_id=$(aws sts get-caller-identity --output json | jq -r '.Account')

echo "Logging to the AWS account $aws_account_id"
aws ecr get-login-password --region $aws_region --profile $profile | docker login --username AWS --password-stdin $aws_account_id.dkr.ecr.$aws_region.amazonaws.com

echo "Building & Pushing $app_name image to ECR"
docker build --no-cache -t $app_name -f Dockerfile .
docker tag $app_name $aws_account_id.dkr.ecr.$aws_region.amazonaws.com/$app_name:$version-$date
docker push $aws_account_id.dkr.ecr.$aws_region.amazonaws.com/$app_name:$version-$date
