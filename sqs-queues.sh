#!/bin/bash

queues=$(aws sqs list-queues --output text --query 'QueueUrls[]' --region eu-west-1)

six_months_ago=$(date -u -d '6 months ago' +'%s')

for queue_url in $queues; do
  message_count=$(aws sqs get-queue-attributes --queue-url $queue_url --attribute-names ApproximateNumberOfMessages --output text --query 'Attributes.ApproximateNumberOfMessages' --region eu-west-1)
  
  if [[ $message_count -gt 0 ]]; then
    echo $queue_url >> active_queues.txt
  fi
done
