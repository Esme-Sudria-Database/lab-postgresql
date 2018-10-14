# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SCRIPT
    cp -rf /vagrant /home/vagrant
    chmod -x /home/vagrant/vagrant/local.ini

    apt-get update
    apt-get install -y python-dev
    apt-get install -y python-pip
    apt-get install -y libffi-dev

    pip install pyopenssl
    pip install markupsafe
    pip install ansible

    export PYTHONUNBUFFERED=1
    ansible-playbook -i "/home/vagrant/vagrant/local.ini" "/vagrant/playbooks/lab-postgres.yml"
  SCRIPT
end
