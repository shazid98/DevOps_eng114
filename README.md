# DevOps

## Before DevOps:

- There was a blame culture between the teams
- Not smooth communication between Operations and Development

![DevOps Diagram](images/devops_diagram.jpg)


## What is DevOps:

- A specified team bridges the gap between operations and development
- Checks and tests things constantly
- Be able to understand the product built by other people; no need to understand how to build a product from scratch
- The environment should work for everyone
- Can be thought of as an extension of the agile method
- Changes in small increments and in iterations
- Continuous testing by developing automated [CI/CD pipelines](https://www.flagship.io/ci-cd/)


## Benefits:

- Everyone can use the same environment which reduces issues between teams
- It gets rid of blame culture, due to the rigorous resting
- People are more flexible so problems can be solved more easily
- Consistent communication between members
- The product theoretically gets better after each iteration



## 4 PILLARS:
- Ease of use; making an easy environment for everyone to use 
- Flexibility; can work on different things and understand most areas
- Robustness; fast solid delivery without much compromise
- Cost; it's cost effective

## Role of DevOps engineer
- The skills required are:
    - Communication
    - Experience with DevOps tools
    - Project Management
    - Optimizing release cycles
    - Coding knowledge (mainly OOP)
    - Infrastructure knowledge
- Writing documentation for features form teh server side
- Analysis of the current system and blueprinting/developing plans for enhancements and improvements (Mainly through automation)
- Cloud deployment and management
- CI/CD (continuous integration and deployment)
- Continuous testingat different stages of the development cycle

# How to initialise vagrant

- Create a directory
- Create a `.gitignore` (put `.vagrant/` and `.log` files as ignored)
- Create a `README.md`
- `vagrant init` *NAME OF OS*
- `rm -rf Vagrantfile`, and `nano` a new `Vagrantfile` with: 

    Vagrant.configure("2") do |config|

        config.vm.box = "ubuntu/xenial64"

    end

- `add`, `commit` and `push`
- `vagrant up` to get it running
- `vagrant ssh` to access shell
- ip is 192.168.10.100 when using nginx


![Vagrant Diagram](/images/vagrant_diagram.png)



# Bash
- `sudo` to run as admin
- `sudo` `apt-get update`, checks internet request
- `apt-get upgrade` will updrage the version
- `apt-get install` will install
- `apt-get install` will install, this case `nginx`, `-y` will automatically say yes
- check nginx status `systemctl status nginx` or `stop` or `start` or `restart` 
- who am I `uname` or `uname -a`
- where am I `pwd` 
- hwo to create a folder in linux `mkdir dir-name`
- how to check folder/file `ls` or `ls -a`
- .folders are hidden
- `cd` to change directory
- come out/back of/from the current location `cd ..`
- only `cd` will bring you to home directory
- `touch` to create a file
- `nano` will create file if it doesnt exist and lets you edit
- `vim` does the same thing
- `mv destination-path` to move files and folders
- to copy it's `cp path_of_data path_of_destination`
- 

#### File Permissions
- READ `r`
- WRITE `w`
- EXECUTE `x`
- how to check file permission `ll`
- change permission `chmod permission file-name`
- `chmod +x provision.sh` appended
- some numbers can be used as permissions
    - ![](path) - for images on vscode readme

## chmod Absolute Mode
 Uses octal numbers. 
- 4 = read 
- 2 = write 
- 1 = execute 
    - Add numbers of permissions you wish to grant. 
- Sum of these is what you provide. 
- Read, write, execute is 7 (4 + 2 + 1). 
- Read, write is 6 (4 + 2). 
    - Complete permissions are expressed as three-digit number. 
- Each digit corresponds to a context (owner, group, other).
    -  E.g. chmod 764 file1 (user = rwx, group = rw and others = read on file1)

           chmod 700 file1 (user = rwx)

           chmod 640 file1 (user = rw, group = r)


### Bash Scripting
- create a file called provision.sh (it can be called anything)
- change permission of this file `chmod +x provision.sh`
- first line *MUST BE* starting with `#!/bin/bash` (called a shebang)
- update and & upgrade
- installed nginx
- checked status
- start nginx
- `enable nginx` (makes it start automatically | optional)

- stopped then started
- To run our script `sudo ./provision.sh`

- create local provision.sh with the commands from before:
    #!/bin/bash

    ### update
    sudo apt-get update -y

    ### upgrade
    sudo apt-get upgrade -y

    ### install nginx
    sudo apt-get install nginx -y

    ### start nginx
    sudo systemctl start nginx

    ### enable nginx
    sudo systemctl enable nginx

- add this to Vagrantfile: `config.vm.provision "shell", path: "./provision.sh", run:"always"` (this executes local provisions file to the VM)

- uploading folder to vm using `config.vm.synced_folder "./app", "/home/vagrant/app"`

### Automated tasks
#### update
`sudo apt-get update -y`

#### upgrade
`sudo apt-get upgrade -y`

#### install nginx
`sudo apt-get install nginx -y`

#### start nginx
`sudo systemctl start nginx`

#### enable nginx
`sudo systemctl enable nginx`

#### download python stuff
`sudo apt-get install python-software-properties`

#### download v6
`curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash`

#### install node-js
`sudo apt-get install nodejs`

#### install pm2
`sudo npm install pm2 -g`

#### redirect to app folder
`cd app/app/`

#### npm install and -d to detach
`npm install -d`

#### start npm
`npm start`


### Creating Variables in Linux
- `MY_NAME=Shazid`
- `echo $MY_NAME` (will print the variable)
- There are a lot of preallocated variables and they can be called with `env`
- to create an environment variable:
    `export`
- E.g. `export MY_NAME` will add it to the environment variables
- `printenv *NAME OF VARIABLE*`
- sudo nano ~/.bashrc
- export [VARIABLE_NAME]=[variable_value]
- source ~/.bashrc
- sudo nano /etc/profile.d/[filename].sh
- unset [VARIABLE_NAME] to unset it
- 

### Reverse Proxy
- `sudo nano /etc/nginx/sites-available/default`
- location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
- `sudo nginx -t` to check for syntax errors
- `sudo systemctl restart nginx`
- cd
- `cd app/app npm start`


# # copying file to the folder location
# sudo cp app/default /etc/nginx/sites-available/default

# # ensuring there are no mistakes
# sudo nginx -t

# # ensuring nginx works fine
# sudo systemctl restart nginx
# sudo systemctl enable nginx

####
- How to find
- How to find out if processes are running:
    - `top` or `ps aux`
- How to kill a process `sudo kill process-id`
- How to use piping | to sort out or short list process
- How to use `head` and `tail`

#### mongodb
`sudo apt-get update -y`

`sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927`

`echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list`

`sudo apt-get update -y`

`sudo apt-get upgrade -y`

##### sudo apt-get install mongodb-org=3.2.20 -y

`sudo apt-get install -y mongodb-org=3.2.20 `

`mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20`
 
`mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20`

##### if mongo is is set up correctly these will be successful
`nano /etc/mongod.conf` - write ip as 0.0.0.0

`sudo systemctl restart mongod`

`sudo systemctl enable mongod`

### What is Cloud Computing
- No Physical servers
- Can be accessed remotely
- Does not occupy physical space 

### Why would we use it
- cost effective
- fast
- reliable with multiple Availability Zones

![Monolith Diagram](/images/monolith.png)
- cant be scaled as easily

- AZs are Availability zones - the region is important, latency can be an issue
- Multiple AZs so there are options in case of emergencies and failures
- Traffic can be diverted to another AZ
- Highly available and scalable
- Users can be connected to the end-point

AWS:
- for tags eng114_shazid_nameofinstance


#### How to copy folder onto cloud vm
- scp -i eng114.pem -r C:/Users/SHAZID/Documents/DevOps_eng114/app user@awsdomain.com:/home/ubuntu/
- do the same things as vagrant, start and install nginx
- reverse proxy by going to root cd /, /etc/nginx/sites-available/default
- go into app folder, install npm and start
- can also use `nohup node app.js > /dev/null 2>&1 &`
- 

### Mongodb

In MongoDB
- start anoMongoDBstance in the same way for the mongodb vm
- use the provision script
- change default file in /etc/nginx/sites-available/ to have 0.0.0.0
- restart and enable mongod


In app
- `sudo echo "export DB_HOST=mongodb://IP/posts" >> ~/.bashrc`
- `source ~/.bashrc`
- `/app/app npm start`
- can also use this for running in the background `nohup node app.js > /dev/null 2>&1 &`

[2 Tier Architecture](/images/2_tier_architecture.png)


### How to Monitor and use Cloud Management
Monitoring & Alert Management

When should we monitor? If we have instances running

Who should be responsible? Developers and maintenance team

Who should be notified in case of failure? Maintenance team

What should be the next steps? IF the demand is too high, it can be autoscaled

Why should we Monitor? Fix live issues, and prevent long downtimes

What aspects should we monitor?

- error logs
- budgeting
- uptime - access time - response time - latency
- security breaches
- system test/health
- instance’s health
- CPU utilisation %
- There are 4 Golden Signals -

- need to have something to monitor
- see if there are any points of failure
- see if something is active or not
- monitor the health of the product (EC2 instance is running)
- Monitor if status code is not 200
- let us know what is wrong, trigger an alert message
- alert the on call staff

Monitoring and Alert Management Services:

- Cloudwatch to monitor AWS service - SNS simple notification service
- SQS simple queue service -

[AWS Diagram](/images/aws_diagram.png)

How to create alarms and notifications through SNS

- create topic
- create subscription
- confirm email
- go to instance and monitor
- select right topic and configuration

[Cloudwatch](/images/cloudwatch.png)

[Autoscaling](/images/autoscaling.png)

- scaled out as needed
- whoever is responsible for adjusting the load balancer decides the minimum, maximum and desired size
- Creating a template will save time

How to do it step by step:

- Need to create a launch template
- Select a type of LB (Load Balancer) - ALB Application Load Balancer: target group/listener group HTTP
- ALB = attach dependencies
- Auto-scaling group - attack this to ALB

DNS ADDRESS OF AUTOSCALING GROUP

USER DATA:

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install nginx

sudo systemctl restart nginx

HOW TO SET UP ALERTS FOR the CPU usage

- cloudwatch
- all alarms
- create alarm
- EC2 and CPU metric
- use topic or create one