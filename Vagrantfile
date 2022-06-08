Vagrant.configure("2") do |config|

	config.vm.define "app" do |app|
		app.vm.box = "ubuntu/xenial64"
		# add a private network between localhost & VM using ip
		app.vm.network "private_network", ip: "192.168.10.100"
		app.vm.provision "file", source: "./provision.sh", destination: "/home/vagrant"
		app.vm.provision "shell", path: "./provision.sh", run:"always"
		app.vm.synced_folder "./app", "/home/vagrant/app"
	end
	
	config.vm.define "db" do |db|
		db.vm.box = "ubuntu/xenial64"
		db.vm.network "private_network", ip: "192.168.10.150"
		db.vm.provision "shell", path: "./db_provision.sh", run:"always"
	end

end
