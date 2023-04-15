#!/bin/bash


if [ $# -eq 1 ]
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
sudo apt-get install curl -y

sudo curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/py3/ubuntu/20.04/amd64/3005/salt-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/py3/ubuntu/20.04/amd64/3005 focal main" | sudo tee /etc/apt/sources.list.d/salt.list

#sudo curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/3005/salt-archive-keyring.gpg
#echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/3005 jammy main" | sudo tee /etc/apt/sources.list.d/salt.list
#sudo curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/py3/ubuntu/18.04/amd64/3005/salt-archive-keyring.gpg
#sudo echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/py3/ubuntu/18.04/amd64/3005 bionic main" | sudo tee /etc/apt/sources.list.d/salt.list
#mv /etc/salt /etc/salt.bak
#exit
sudo apt-get -y  update
sudo apt-get install -y  salt-minion
sudo sed -i -e 's@\#master: salt@master: '$ip_address'@g' /etc/salt/minion
sudo sed -i -e 's@\#id:@id: '$probe_id'@g' /etc/salt/minion


sudo systemctl enable salt-minion.service
sudo systemctl restart salt-minion.service
