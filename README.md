##Zoneminder playbook with vagrant repro enviroment##
  
**Requirements:**  
1. [Install Vagrant](https://www.vagrantup.com/docs/installation/)  
2. [Install Ansible](http://docs.ansible.com/ansible/intro_installation.html)  
3. Install [virtualbox](https://www.virtualbox.org/wiki/Downloads) or [vmware fusion](http://www.vmware.com/products/fusion.html)  
4. [Install Vagrant VMWare (if you want to use vmware)](https://www.vagrantup.com/vmware/)  

**virtualbox example:**  
```vagrant up --provider virtualbox```  
Then go to [http://localhost:8080/zm](http://localhost:8080/zm)  
**vmware_fusion example:**  
```vagrant up --provider vmware_fusion```  
Then go to [http://localhost:8080/zm](http://localhost:8080/zm)  
  
**Get Started (demo in vagrant):**  
1. Modify cgi-bin path: Options -> Paths -> PATH_ZMS -> /zm/cgi-bin/nph-zms  
  
**TODO:**  
1. Push to metal and include steps  
2. Build custom docker container that optionally depends on mysql container  
