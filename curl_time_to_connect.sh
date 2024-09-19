#!/bin/bash
url="https://cmsapigw.devops.com/api/worknos/?populate=*"

echo "Running initial request..."
curl -o /dev/null -s -w "Initial Request:\nTime to Connect: %{time_connect}s\nTime to First Byte: %{time_starttransfer}s\nTotal Time: %{time_total}s\n\n" "$url"

echo "Running subsequent requests..."
for i in {1..5}
do
   curl -o /dev/null -s -w "Request $i:\nTime to Connect: %{time_connect}s\nTime to First Byte: %{time_starttransfer}s\nTotal Time: %{time_total}s\n\n" "$url"
done