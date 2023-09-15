#!/bin/bash

# Load configurations
source config/ec2-config.sh
source config/sg-config.sh

# You can tag your EC2 instances to easily query them later. 
# For this script, let's assume you've tagged your EC2 instance with "Purpose"="MySQLInstance".

# Get the Instance ID of the EC2 instance with the tag "Purpose"="MySQLInstance"
INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=tag:Purpose,Values=MySQLInstance" "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].InstanceId" --output text)

# Terminate the EC2 instance
if [ -n "$INSTANCE_ID" ]; then
    echo "Terminating EC2 instance: $INSTANCE_ID"
    aws ec2 terminate-instances --instance-ids $INSTANCE_ID
else 
    echo "No EC2 instance found with tag Purpose=MySQLInstance"
fi

# Wait until the instance is terminated
aws ec2 wait instance-terminated --instance-ids $INSTANCE_ID

# Delete the security group
# Note: You might need to wait a bit before deleting the security group after terminating the EC2 instance.
# This is because the security group could still be in use until the instance is fully terminated.
echo "Deleting security group: $GROUP_NAME"
aws ec2 delete-security-group --group-name $GROUP_NAME

echo "Teardown completed."
