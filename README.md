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
- Continuous testingat different stages of teh development cycle

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
<<<<<<< HEAD

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
