#!/bin/bash

# update
sudo apt-get update -y

# upgrade
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# start nginx
sudo systemctl start nginx

# enable nginx
sudo systemctl enable nginx

# download python stuff
sudo apt-get install python-software-properties

# download v6
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash

# install node-js
sudo apt-get install nodejs

# install pm2
sudo npm install pm2 -g

# redirect to app folder
cd app/app/

# npm install
npm install -d

# start it
npm start

