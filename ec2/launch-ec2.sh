#!/bin/bash
source ../config/ec2-config.sh
aws ec2 run-instances --image-id $AMI_ID --instance-type $INSTANCE_TYPE --key-name $KEY_PAIR --security-group-ids $SECURITY_GROUP --user-data file://user-data/install-docker-mysql.sh