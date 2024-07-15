#!/bin/sh
echo "Hello World"
temp_role=$(aws sts assume-role --role-arn "arn:aws:iam::905418080828:user/Jenkin" --role-session-name "testsession")
export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo $temp_role | jq -r .Credentials.SessionToken)
echo "$AWS_ACCESS_KEY_ID"
echo "$AWS_SECRET_ACCESS_KEY"
