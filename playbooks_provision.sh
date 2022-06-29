#!/bin/bash

# sudo mv DevOps_eng114/playbooks/nginx-playbook.yml /etc/ansible
# sudo mv DevOps_eng114/playbooks/reverse-proxy-playbook.yml /etc/ansible
# sudo mv DevOps_eng114/playbooks/node-playbook.yml /etc/ansible
# sudo mv DevOps_eng114/playbooks/npm-playbook.yml /etc/ansible
# sudo mv DevOps_eng114/playbooks/mongodb-playbook.yml /etc/ansible
# sudo mv DevOps_eng114/playbooks/copy-playbook.yml /etc/ansible
# sudo mv DevOps_eng114/playbooks/app-run-playbook.yml /etc/ansible

cd /etc/ansible
sudo ansible-playbook nginx-playbook.yml --ask-vault-pass
sudo ansible-playbook reverse-proxy-playbook.yml --ask-vault-pass
sudo ansible-playbook node-playbook.yml --ask-vault-pass
sudo ansible-playbook npm-playbook.yml --ask-vault-pass
sudo ansible-playbook copy-playbook.yml --ask-vault-pass
sudo ansible-playbook mongodb-playbook.yml --ask-vault-pass
sudo ansible-playbook app-run-playbook.yml --ask-vault-pass

