# -*- mode: ruby -*-
# vi: set ft=ruby :

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
