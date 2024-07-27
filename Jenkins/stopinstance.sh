#!/bin/bash
echo "Hello World"
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
echo "------------------------------------------"
aws sts get-caller-identity
echo "------------------------------------------"
temp_role=$(aws sts assume-role --role-arn arn:aws:iam::905418080828:role/24_EC2S3  --role-session-name testsession)
export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo $temp_role | jq -r .Credentials.SessionToken)
echo "$AWS_ACCESS_KEY_ID"
echo "$AWS_SECRET_ACCESS_KEY"
echo "$AWS_SESSION_TOKEN"
aws sts get-caller-identity
#aws ec2 run-instances --image-id ami-0427090fd1714168b --count 2 --instance-type t2.micro --key-name key-02 --security-group-ids sg-06de595cfe17d5f71 --subnet-id subnet-054c4912158d85c1f
int=$(aws ec2 describe-instances     --query 'Reservations[*].Instances[*].[InstanceId]' \
--filters "Name=instance-state-name,Values=stopped" \
--output text)
echo "$int"
aws ec2 start-instances --instance-ids $int
