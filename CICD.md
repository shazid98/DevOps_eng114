# CICD

![Diagram CICD](/images/cicd_diagram_jenkins.png)

### CI - Continuous Integration
- Automated process of building and testing so it can be processed into the next stage quickly

### CD - Continuos Delivery
- In continuous delivery the deployment is manual

### CDE - Continuous Deployment
- With CDE, the code is compiled, tested and dropped into the staging environment.


### What is Jenkins?
- Jenkins is an open-source automation tool written in Java with plugins built for Continuous Integration purposes. 
- Jenkins is used to build and test your software projects continuously
- Automation Tool
- Best for CICD pipelines


### Benefits of CICD
- Faster time to deliver working products as everything is automated and using agile/DevOps techniques
- Reduced risk as more tests can be done as development is faster
- Shorter review time
- Better code quality
- Smoother Path to Production
- Efficient Infrastructure
- Measurable Progress
- Better Communication and Communication
- Better Creativity due to continuous feedback
- Less Manual effort and saves time
- Easier Rollbacks

### CICD Tools
![Tools](/images/cicd_tools.png)

- Jenkins
- CircleCi
- TeamCity
- Bamboo
- GitLab

### Why Jenkins?
- Open Source automation server
Java based program with packages for windows, macos and linux. Works on most OS
- A lot of Plugins are avilable
- Huge community contributes plugin resource


### When should we use CICD
- Before anything conduct a cost beenfit analsysis:
    - Is the task repetitive? If so invest in automation


### Github SSH
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account


### Jenkins
Plan:
- Need to generate ssh key pair on [localhost](http://localhost) in .ssh folder
- Copy the 114 [114.pub](http://114.pub) key to our Github
- test ssh connection

![](/images/jenkins_diagram.png)

### How to set up webhook
- Add the url so it should look like this `http://jenkins-ip:8080/github-webhook/
- Go onto Jenkins
    - Select your project
    - Select configure
    - Scroll down to Build Triggers
    - Select Github hook trigger for GITScm polling
- Now your webhook is fully configured

### Merging Github with automation
So we want to create a dev branch and work from there

- Jenkins
    - Go to Configure
    - Scroll down to Source Code Management
    - On branches to build, you want it to listen to your dev branch so change main to dev
    - Scroll down to Add post-build action, and add Git publisher
    - Tick Push Only If Build Succeeds and Merge Results
    - Add branch
    - Branch to push: refs/heads/main
    - Target remote name: origin

Go to your new branch
- Add a random file in that branch
- Add it, commit and push 
- Then go to Jenkins and watch it finish
- You can go to console output to see if everything looks good
- Go to Github and select your main branch and see if the file is there


### How to integrate CD
- Make a separate job for it
- Connect it to github
- Enable the connection with EC2, security group
- Make sure it runs after the CI runs first

![](/images/ss1.png)

![](/images/ss2.png)

![](/images/ss3.png)

![](/images/ss4.png)

![](/images/ss5.png)

![](/images/ss6/png)

### How to create Jenkins server
Objectives:
- Create an EC2 instance
- SSH into EC2 instance
- Install and create Jenkins server
- Set up Jenkins on the browser
- Install plugins

Create EC2 instance on AWS
`ssh` in
Install Java

`sudo apt update`

`sudo apt install openjdk-8-jdk`

`wget -q -O - [https://pkg.jenkins.io/debian/jenkins.io.key](https://pkg.jenkins.io/debian/jenkins.io.key) | sudo apt-key add -`

`sudo sh -c 'echo deb [http://pkg.jenkins.io/debian-stable](http://pkg.jenkins.io/debian-stable) binary/ > /etc/apt/sources.list.d/jenkins.list'`

`sudo apt update`

`sudo apt install jenkins`

`systemctl status jenkins`

Changing security groups and adding port 8080 - 0.0.0.0/0

`sudo cat /var/lib/jenkins/secrets/initialAdminPassword` (to find password)

### Jenkins in browser
- Access using Jenkins EC2 IP ip:8080
- Install suggested plugins
- Create Admin User details
- Install other plugins such as npm, nodejs (changing to version 13.3 in global config), ssh agent


### IaC
Infrastructure as Code (IaC) is the managing and provisioning of infrastructure through code instead of through manual processes. 

Automates the process of building infrastructure.

With IaC, configuration files are created that contain your infrastructure specifications, which makes it easier to edit and distribute configurations. It also ensures that you provision the same environment every time. By codifying and documenting your configuration specifications, IaC aids configuration management and helps you to avoid undocumented, ad-hoc configuration changes.

#### Benefits of IaC
- Cost reduction
- Increase in speed of deployments
- Reduce errors 
- Improve infrastructure consistency
- Eliminate configuration drift

#### Tools
These are a few popular choices:
- Chef
- Puppet
- Red Hat Ansible Automation Platform
- Saltstack
- Terraform 
- AWS CloudFormation

IaC is an important part of implementing DevOps practices and continuous integration/continuous delivery (CI/CD). IaC takes away the majority of provisioning work from developers, who can execute a script to have their infrastructure ready to go.  

#### Configuration management
Configuration management is a systems engineering process for establishing and maintaining consistency of a product's performance, functional, and physical attributes with its requirements, design, and operational information throughout its life

Configuration management is a process for maintaining computer systems, servers, and software in a desired, consistent state. It’s a way to make sure that a system performs as it’s expected to as changes are made over time.

- Classify and manage systems by groups and subgroups. 
- Centrally modify base configurations.
- Roll out new settings to all applicable systems. 
- Automate system identification, patches, and updates
- Identify outdated, poor performing, and noncompliant configurations. 
- Prioritize actions. 
- Access and apply prescriptive remediation

#### Orchestration
- Automated workflows
- Automates repetitive tasks, like cloud servers

#### Ansible
- Ansible is an open-source software provisioning, configuration management, and application-deployment tool enabling infrastructure as code.
- just need to use playbooks, 
- agentless, no ansible agent needed, can be opened using ssh, highly flexible
- ansible is simple and works with various operating systems
- Automation platform, to automate tasks

#### IaC-Ansible-Terraform
Ansible can be used to automate the process of configuring terraform
Terraform can be used to automate

#### Benefits of the business
- configuration management can solve issues locally instead of replacing the system entirely


#### VMS
controller: IP = 192.168.33.12 
web: IP = 192.168.33.10
db: IP =192.168.33.11

![](/images/ansible_diagram.png)

Agentless means there is no need for an installation in other locations, just need it in controller

How to build vagrant:

- vagrant up
- ssh in into each machine `vagrant ssh machinename`
- PW is vagrant, does not show when typing
- run `sudo apt-get update -y`  in each machine
- run `sudo apt-get upgrade -y` in each machine

Once vagrant is up

- ssh into controller machine
- `ssh vagrant@ip-of-machine` to access and ssh into other machines from controller 9or any vm, but controller in this case)
- exit to exit into previous machine
- `sudo apt-get install software-properties-common`
- `sudo apt-add-repository ppa:ansible/ansible`
- check python version `python --version`
- install ansible `sudo apt-get install ansible -y`
- `ansible --version` to check if it has been installed properly
    ![](/images/ansible_version.png)
    ansible folder structure

/etc/ansible

hosts/inventory & ansible.config

we need to let ansible know where we’re hosting

![](/images/ansible_folder.png)


- Hosts file will have hosts
- cd into ansible folder `cd /etc/ansible/`
- `ping [www.website.com](http://www.website.com)` to check ping
- write the ips you want to connect to in the hosts file
- `sudo nano hosts`
- add ip (under step 2)
- use `[nameofgroup]` for list of ips (groups)
- in our case `[web]`
    ![](/images/ansible_hosts.png)

`[web]`
`192.168.33.10 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant` 
`ansible web -m ping`
![](/images/ansible_ping.png)

- do the same for db and add it to the hosts
    - `[db]`
    `192.168.33.11 ansible_connection=ssh ansible_ssh_user=vagrant ansible_ssh_pass=vagrant`
    - `ansible db -m ping`





