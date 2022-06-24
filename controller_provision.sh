#!/bin/bash

# update and upgrade
sudo apt update -y && sudo apt upgrade -y
sudo apt-get update -y

#install ansible	
sudo apt-get install software-properties-common
	
sudo apt-add-repository ppa:ansible/ansible -y
	
sudo apt-get update
	
sudo apt-get install ansible -y

#sudo rm -rf /etc/ansible
cd ~/
git clone https://github.com/shazid98/DevOps_eng114.git 
export ANSIBLE_HOST_KEY_CHECKING=False

sudo mv DevOps_eng114/playbooks/nginx-playbook.yml
sudo mv DevOps_eng114/playbooks/reverse-proxy-playbook.yml
sudo mv DevOps_eng114/playbooks/node-playbook.yml
sudo mv DevOps_eng114/playbooks/npm-playbook.yml
sudo mv DevOps_eng114/playbooks/mongodb-playbook.yml
sudo mv DevOps_eng114/playbooks/copy-playbook.yml
sudo mv DevOps_eng114/playbooks/app-run-playbook.yml

cd /etc/ansible
ansible-playbook nginx-playbook.yml
ansible-playbook reverse-proxy-playbook.yml
ansible-playbook node-playbook.yml
ansible-playbook npm-playbook.yml
ansible-playbook mongodb-playbook.yml
ansible-playbook copy-playbook.yml
ansible-playbook app-run-playbook.yml