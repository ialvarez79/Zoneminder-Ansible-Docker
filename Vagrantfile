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
  config.vm.define "media-server" do |ubuntu|
    ubuntu.vm.box = "slowe/ubuntu-trusty-x64"
    ubuntu.vm.provision "docker" do |docker|
      docker.run "mysql",
        args: "-e MYSQL_ROOT_PASSWORD=uberpass -e MYSQL_DATABASE=zm -e MYSQL_USER=zm -e MYSQL_PASSWORD=my-secret-pass --name=zm-mysql"
      #docker.run "hrwebasst/docker-zoneminder",
      #  args: "--name=zoneminder --link=zm-mysql:mysql -p 443:443 --privileged=true"
    end

    ubuntu.vm.provision "file", source: "docker-zoneminder", destination: "/home/vagrant/docker-zoneminder"
    
    ubuntu.vm.provision "shell",
    inline: "docker rm -v $(docker ps -a -q -f status=exited)",
      inline: "apt-get update && apt-get upgrade",
      inline: "apt-get install -y vim tmux",
      inline: "cd /home/vagrant/docker-zoneminder && docker build -t rileyschuit/zoneminder .",
      inline: 'cd /home/bagrant/docker-zoneminder && docker run -dit -e "ZM_MYSQL_USER=zm" -e "ZM_MYSQL_PASS=my-secret-pass" -e "ZM_MYSQL_HOST=zm-mysql" -e "ZM_DB_NAME=zm" --link="zm-mysql:zm-mysql" -p 80:80 rileyschuit/zoneminder'

    #ubuntu.vm.provider "virtualbox" do |vb|
    ubuntu.vm.provider "vmware_fusion" do |vb|
      vb.vmx["numvcpus"] = "4"
      vb.vmx["memsize"] = "4096"
      vb.vmx["ethernet0.virtualdev"] = "vmxnet3"
    end

  end
end
