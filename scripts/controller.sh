#!/bin/bash

# update and upgrade
sudo apt update -y && sudo apt upgrade -y
sudo apt-get update -y

#install ansible	
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

#install python and boto3
sudo apt install python
sudo apt install python-pip -y
sudo pip install --upgrade pip
sudo pip install boto
sudo pip install boto3

sudo rm -rf /etc/ansible
sudo git clone https://github.com/shazid98/DevOps_eng114.git $HOME
export ANSIBLE_HOST_KEY_CHECKING=False

cd /etc/ansible
sudo mkdir group_vars
cd group_vars
sudo mkdir all