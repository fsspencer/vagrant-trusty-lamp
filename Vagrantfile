# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/etc/config.yaml")

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :path => "install/composer.sh"
  
  if configs['configs']['services']['xdebug'] == true
    config.vm.provision :shell, :path => "install/xdebug.sh"
  end
  if configs['configs']['services']['nodejs'] == true
    config.vm.provision :shell, :path => "install/nodejs.sh"
  end
  if configs['configs']['services']['redis'] == true
    config.vm.provision :shell, :path => "install/redis.sh"
  end
  if configs['configs']['services']['memcached'] == true
    config.vm.provision :shell, :path => "install/memcached.sh"
  end
  if configs['configs']['services']['mailutils'] == true
    config.vm.provision :shell, :path => "install/mailutils.sh"
  end
  if configs['configs']['services']['elasticsearch'] == true
    config.vm.provision :shell, :path => "install/elasticsearch.sh"
  end

  config.vm.network "private_network", ip: configs['configs']['general']['public_ip']

  config.vm.synced_folder "./etc", "/etc/vagrant", owner: "vagrant", group: "vagrant"
  config.vm.synced_folder "./sites", "/var/www", owner: "vagrant", group: "vagrant"
  config.vm.synced_folder "./scripts", "/scripts", owner: "vagrant", group: "vagrant"

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
end
