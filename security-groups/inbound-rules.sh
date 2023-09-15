#!/bin/bash
aws ec2 authorize-security-group-ingress --group-name MySQLSecurityGroup --protocol tcp --port 3306 --cidr 0.0.0.0/0