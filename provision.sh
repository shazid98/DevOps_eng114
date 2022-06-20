#!/bin/bash

#update & upgrade
sudo apt update -y

sudo apt upgrade -y

# install nginx
sudo apt install nginx -y


# enable nginx
sudo systemctl enable nginx


# start nginx
sudo systemctl start nginx



# install nodejs v6
sudo curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -



# install nodejs part 2
sudo apt install nodejs -y
sudo apt install python-software-properties -y



# install pm2
sudo npm install pm2 -g



# copy default into sites-available and enabling nginx to work again with the new default file
# sudo rm -rf etc/nginx/sites-available/default
# sudo cp default /etc/nginx/sites-available/
# sudo nginx -t
sudo systemctl restart nginx
sudo systemctl enable nginx

cd sre_jenkins_cicd/app

sudo apt-get install npm -y
npm start


# Adding env variable
# sudo echo "export DB_HOST=mongodb://192.168.10.150:27017/posts" >> .bashrc
# source .bashrc



# cd into app and install and start app
# cd app/app/
# npm install
# nohup node app.js > /dev/null 2>&1 &



# #!/bin/bash

# # update
# sudo apt-get update -y

# # upgrade
# sudo apt-get upgrade -y

# # install nginx
# sudo apt-get install nginx -y

# # start nginx
# sudo systemctl start nginx

# # enable nginx
# sudo systemctl enable nginx

# # download python stuff
# sudo apt-get install python-software-properties -y

# # download v6
# sudo curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# # install node-js
# sudo apt-get install nodejs -y

# # install pm2
# sudo npm install pm2 -g

# sudo echo "export DB_HOST=mongodb://192.168.10.150:27017/posts" >> ~/.bashrc

# sudo source ~/.bashrc



# redirect to app folder
#cd app/app/

# seeds
# node seeds/seed.js

# npm install
#npm install

# start it
# npm start -d

# cd $HOME




