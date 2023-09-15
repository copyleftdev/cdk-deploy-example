#!/bin/bash
source config/ec2-config.sh
source config/sg-config.sh

./security-groups/create-sg.sh
./security-groups/inbound-rules.sh
./ec2/launch-ec2.sh