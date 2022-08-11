#!/bin/bash

for repository in `cat ecr.txt` # file with names of remote repositories
do
  aws ecr describe-images --repository-name $repository | grep -E 'repositoryName|Pull' >> lastPull.txt
done
