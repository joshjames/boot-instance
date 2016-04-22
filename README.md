# boot-instance

Simple bash script using the aws cli to spin up a ec2 instance and update DNS.

# dependencies
- AWS-CLI (apt-get install aws-cli)
- cli53 (here: https://github.com/barnybug/cli53)
- configuration of your Access keys and region

# install
copy boot-instance to /usr/local/bin
chmod +x the script
edit the script to add your instance-id and dns settings.
profit.

