
#!/bin/bash
###################################################################
#Script Name    :rdsCheckStop.sh
#Description    :Stop running RDS Instances (daily for jenkins job) if environment EC2 Instance is stopped.
#Date           :27-January-2021
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
str2='    "unreachable": true'
array1=("ireland/test_mt" "ireland/env1" "ireland/env2" "virginia/env3" "brazil/env4")
array2=("env1-db-all" "env2-db-all" "env3-db-all" "env4-db-all")
array3=("eu-west-1" "eu-west-1" "us-east-1" "sa-east-1")
array4=("prod" "dev" "dev" "stage")
lenght=${#array1[@]}
for i in "${!array1[@]}"; do
  str1=`ansible -i environments/aws/${array1[$i]}/inventory.yml host_group -m ping | grep '"unreachable": true'`
if [[ $str1 == $str2 ]]; then
 aws rds stop-db-instance --db-instance-identifier ${array2[$i]} --region ${array3[$i]} --profile ${array4[$i]}
 echo "DB Instance ${array2[$i]} is stopped!"
else
 echo "The environment for DB instance ${array2[$i]} is running! No need to stop!"
fi
done