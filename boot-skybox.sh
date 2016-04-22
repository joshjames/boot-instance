#!/bin/bash
clear
instance_id=i-f5b9e02a
aws ec2 start-instances --instance-ids=$instance_id --profile skyramp
echo "starting launchpost instance"
while state=$(aws ec2 describe-instances --instance-ids $instance_id --profile skyramp --output text --query 'Reservations[*].Instances[*].State.Name' --profile skyramp); test "$state" = "pending"; do
  sleep 2; echo -n '.'
done; echo " $state"
PublicDnsName=$(aws ec2 describe-instances --instance-ids $instance_id --profile skyramp --output text --query 'Reservations[*].Instances[*].PublicDnsName')
echo PublicDnsName=$PublicDnsName
echo "removing old dns entry"
cli53 rrdelete skyramp.net box CNAME--profile skyramp
sleep 2
echo "creating new dns entry"
cli53 rrcreate --replace skyramp.net 'box 30 CNAME $PublicDnsName' --profile skyramp
