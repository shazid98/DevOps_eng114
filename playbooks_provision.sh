#!/bin/bash

sudo mv DevOps_eng114/playbooks/nginx-playbook.yml /etc/ansible
sudo mv DevOps_eng114/playbooks/reverse-proxy-playbook.yml /etc/ansible
sudo mv DevOps_eng114/playbooks/node-playbook.yml /etc/ansible
sudo mv DevOps_eng114/playbooks/npm-playbook.yml /etc/ansible
sudo mv DevOps_eng114/playbooks/mongodb-playbook.yml /etc/ansible
sudo mv DevOps_eng114/playbooks/copy-playbook.yml /etc/ansible
sudo mv DevOps_eng114/playbooks/app-run-playbook.yml /etc/ansible

cd /etc/ansible
ansible-playbook nginx-playbook.yml
ansible-playbook reverse-proxy-playbook.yml
ansible-playbook node-playbook.yml
ansible-playbook npm-playbook.yml
ansible-playbook mongodb-playbook.yml
ansible-playbook copy-playbook.yml
ansible-playbook app-run-playbook.yml