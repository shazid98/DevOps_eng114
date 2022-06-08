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
sudo apt-get install python-software-properties -y

# download v6
sudo curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# install node-js
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

sudo echo "export DB_HOST=mongodb://192.168.10.150:27017/posts" >> ~/.bashrc

sudo source ~/.bashrc



# redirect to app folder
#cd app/app/

# seeds
# node seeds/seed.js

# npm install
#npm install

# start it
# npm start -d

# cd $HOME




