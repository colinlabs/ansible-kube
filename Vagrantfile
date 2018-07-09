# -*- mode: ruby -*-
# vi: set ft=ruby :

$num_instances = 3

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.box_check_update = false

  (1..$num_instances).each do |i|
    config.vm.define "node-#{i}" do |node|
      ip = "172.20.1.#{i+100}"
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
      node.vm.hostname = "node-#{i}"
      node.vm.network "private_network", ip: ip
      node.vm.provider "virtualbox" do |vb|
      #   vb.gui = true
      # Customize the amount of memory on the VM:
      vb.memory = "2048"
      vb.cpus = 2
      vb.name = "node-#{i}"
    end
      node.vm.provision "shell", inline: <<-SHELL
        # sed -i "s@security.ubuntu.com@mirrors.aliyun.com@g;s@archive.ubuntu.com@mirrors.aliyun.com@g" /etc/apt/sources.list
        # apt-get update
        # apt-get install python3
        ln -sf /usr/bin/python3 /usr/bin/python
        echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
        echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
      SHELL
    end
  end

end
