#!/bin/sh
echo "Hello World"
#AWS_ACCESS_KEY_ID=""
#AWS_SECRET_ACCESS_KEY=""
echo "------------------------------------------"
aws sts get-caller-identity
echo "------------------------------------------"
temp_role=$(aws sts assume-role --role-arn arn:aws:iam::905418080828:role/EC2-Role  --role-session-name testsession)
export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo $temp_role | jq -r .Credentials.SessionToken)
echo "$AWS_ACCESS_KEY_ID"
echo "$AWS_SECRET_ACCESS_KEY"
echo "$AWS_SESSION_TOKEN"
#aws sts get-caller-identity
echo "After assuming role"
echo"------------------------"
aws ec2 describe-instances     --query 'Reservations[0].Instances[0].NetworkInterfaces[0].Attachment.AttachmentId' \
--filters "Name=instance-type,Values=t2.micro" \
--output json
#--output table or text
