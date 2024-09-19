#!/usr/bin/env bash

ENVIRONMENT=$1
REGION=$2
NAMESPACE=devops


source ./build/get-aws-creds.sh $ENVIRONMENT

echo "Clearing Redis cache for $ENVIRONMENT..."

REDIS_WRITER_CONN=$(aws ssm get-parameter --name "/$NAMESPACE/$ENVIRONMENT/Redis/WriterConnectionString" --with-decryption --query 'Parameter.Value' --region $REGION --output text)
REDIS_READER_CONN=$(aws ssm get-parameter --name "/$NAMESPACE/$ENVIRONMENT/Redis/ReaderConnectionString" --with-decryption --query 'Parameter.Value' --region $REGION --output text)

REDIS_WRITER_HOST=$(echo $REDIS_WRITER_CONN | cut -d ':' -f 1)  
REDIS_READER_HOST=$(echo $REDIS_READER_CONN | cut -d ':' -f 1)

echo "Flushing Redis Writer at $REDIS_WRITER_HOST..."
redis-cli -h $REDIS_WRITER_HOST FLUSHALL

echo "Flushing Redis Reader at $REDIS_READER_HOST..."
redis-cli -h $REDIS_READER_HOST FLUSHALL

echo "Redis cache cleared for $ENVIRONMENT."
