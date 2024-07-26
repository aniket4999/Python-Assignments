#!/bin/bash
temp=$(aws ec2 describe-instances     --query 'Reservations[0].Instances[0].state' \
--filters "Name=instance-type,Values=t2.micro" \
--output json)
for i in $temp
do
        if

aws ec2 stop-instances \
    --instance-ids
