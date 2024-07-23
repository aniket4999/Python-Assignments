#!/bin/sh
echo "Hello World"
temp_role=$(aws sts assume-role --role-arn "arn:aws:iam::905418080828:role/jenkinsrole" --role-session-name "testsession")
export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo $temp_role | jq -r .Credentials.SessionToken)
echo "$AWS_ACCESS_KEY_ID"
echo "$AWS_SECRET_ACCESS_KEY"
aws sts get-caller-identity

*******
export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
$(aws sts assume-role \
--role-arn arn:aws:iam::123456789012:role/MyAssumedRole \
--role-session-name MySessionName \
--query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
--output text))
