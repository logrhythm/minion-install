#!/bin/bash


if [ $# -eq 0 ]
  then
    echo "install-salt-minion.sh <CCN Address> <probe name>"
    exit;
fi


ip_address=$1
probe_id=$2
set -x
#sudo apt install python-software-properties
sudo apt-get -y  update

sudo apt-get install -y python3-software-properties

#wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
#sudo su
sudo curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/py3/ubuntu/18.04/amd64/3004/salt-archive-keyring.gpg

#sudo echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main' >> /etc/apt/sources.list.d/saltstack.list
sudo echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/py3/ubuntu/18.04/amd64/3004 bionic main" | sudo tee /etc/apt/sources.list.d/salt.list

#exit
sudo apt-get -y  update
sudo apt-get install -y  salt-minion
sudo sed -i -e 's@\#master: salt@master: '$ip_address'@g' /etc/salt/minion
sudo sed -i -e 's@\#id:@id: '$probe_id'@g' /etc/salt/minion


sudo systemctl enable salt-minion.service
sudo systemctl restart salt-minion.service
