#!/bin/bash
 
lsb_dist="$(. /etc/os-release && echo "$ID")"
dist_version="$(. /etc/os-release && echo "$VERSION_ID")"
if [ "$lsb_dist" =  "centos" ]; then
	yum-config-manager --add-repo https://rpm.releases.teleport.dev/teleport.repo
	yum install teleport -y
elif [ "$lsb_dist" =  "ubuntu" ]; then
    curl https://deb.releases.teleport.dev/teleport-pubkey.asc | sudo apt-key add -
	add-apt-repository 'deb https://deb.releases.teleport.dev/ stable main'
	apt-get update -y
	apt install teleport -y
else
	echo "You are not using CentOS or Ubuntu, hence, this script won't work, remind me to update this"
fi
