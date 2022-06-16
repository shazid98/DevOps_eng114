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