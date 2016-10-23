# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
#
#
#sudo docker run -d -e MYSQL_ROOT_PASSWORD=uberpass -e MYSQL_DATABASE=zm -e MYSQL_USER=zm -e MYSQL_PASSWORD=my-secret-pass --name=zm-mysql mysql
#sudo docker run -d --name=zoneminder --link=zm-mysql:mysql -p 443:443 --privileged=true hrwebasst/docker-zoneminder
#
Vagrant.configure(2) do |config|
  config.vm.define "cctv-server" do |ubuntu|
    ubuntu.vm.hostname = "cctv.dev"
    
    ubuntu.vm.network "forwarded_port", guest: 80, host: 8080

    # vagrant up --provider vmware_fusion
    #ubuntu.vm.box = "slowe/ubuntu-trusty-x64"
    #ubuntu.vm.provider "vmware_fusion" do |vb|
    #  vb.vmx["numvcpus"] = "2"
    #  vb.vmx["memsize"] = "2048"
    #  vb.vmx["ethernet0.virtualdev"] = "vmxnet3"
    #end
    
    #  vagrant up --provider virtualbox
    ubuntu.vm.box = "ubuntu/trusty64"
    ubuntu.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 2
    end

    ubuntu.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
    end
  end
end
