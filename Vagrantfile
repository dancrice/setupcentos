# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false
  config.vm.box = "centos65"
  config.vm.box_url = "https://github.com/2creatives/" +
    "vagrant-centos/releases/download/v6.5.3/" +
    "centos65-x86_64-20140116.box"
  config.vm.network "forwarded_port", guest: 3306, host: 6606
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.222.110"
  config.vm.network "public_network", bridge: "en0: Ethernet"
  config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end
#  config.vm.provision "ansible" do |ansible|
#    ansible.playbook = "playbook.yml"
#    ansible.verbose = "vvvv"
#    ansible.sudo = true
#    ansible.tags = ENV['ANSIBLE_TAGS']
#  end
  config.vm.provision "shell", path: "setup.sh"
end
