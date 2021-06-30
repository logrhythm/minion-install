#!/bin/bash


if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit;
fi


ip_address=$1
set -x
sudo apt install python-software-properties
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
#sudo su
sudo echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main' >> /etc/apt/sources.list.d/saltstack.list
#exit
sudo apt update
sudo apt install salt-minion
sudo sed -i -e 's@\#master: salt@master: '$ip_address'@g' /etc/salt/minion

sudo systemctl enable salt-minion.service
sudo systemctl restart salt-minion.service
