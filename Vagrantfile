# -*- mode: ruby -*-
 # vi: set ft=ruby :
 
 # All Vagrant configuration is done below. The "2" in Vagrant.configure
 # configures the configuration version (we support older styles for
 # backwards compatibility). Please don't change it unless you know what
 
 # MULTI SERVER/VMs environment 
 #
 Vagrant.configure("2") do |config|

    # creating first VM called web  
      config.vm.define "web" do |web|
        
        web.vm.box = "bento/ubuntu-18.04"
       # downloading ubuntu 18.04 image
    
        web.vm.hostname = 'web'
        # assigning host name to the VM
        
        web.vm.network :private_network, ip: "192.168.33.10"
        #   assigning private IP
        
        #config.hostsupdater.aliases = ["development.web"]
        # creating a link called development.web so we can access web page with this link instread of an IP   
            
      end
      
    # creating second VM called db
      config.vm.define "db" do |db|
        
        db.vm.box = "bento/ubuntu-18.04"
        
        db.vm.hostname = 'db'
        
        db.vm.network :private_network, ip: "192.168.33.11"
        
        #config.hostsupdater.aliases = ["development.db"]     
      end
        # creating are Ansible controller
      config.vm.define "controller" do |controller|
        
        controller.vm.box = "bento/ubuntu-18.04"
          
        controller.vm.hostname = 'controller'
          
        controller.vm.network :private_network, ip: "192.168.33.12"
          
        controller.vm.provision "file", source: "controller_provision.sh", destination: "$HOME/"
   
        controller.vm.provision "shell", inline: "sudo chmod +x controller_provision.sh"
        
        controller.vm.provision "file", source: "playbooks_provision.sh", destination: "$HOME/"
   
        controller.vm.provision "shell", inline: "sudo chmod +x playbooks_provision.sh"

        # controller.vm.provision "shell", inline: "sudo ./controller_provision.sh"

          # config.hostsupdater.aliases = ["development.controller"] 
          
        end 
    
    end



# Vagrant.configure("2") do |config|

# 	config.vm.define "app" do |app|
# 		app.vm.box = "ubuntu/xenial64"
# 		# add a private network between localhost & VM using ip
# 		app.vm.network "private_network", ip: "192.168.10.100"
# 		app.vm.provision "file", source: "./provision.sh", destination: "/home/vagrant"
# 		app.vm.provision "shell", path: "./provision.sh", run:"always"
# 		app.vm.synced_folder "./app", "/home/vagrant/app"
# 	end
	
# 	config.vm.define "db" do |db|
# 		db.vm.box = "ubuntu/xenial64"
# 		db.vm.network "private_network", ip: "192.168.10.150"
# 		db.vm.provision "shell", path: "./db_provision.sh", run:"always"
# 	end

# end
