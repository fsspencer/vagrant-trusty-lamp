# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/etc/config.yaml")
vagrant_config = configs['configs'][configs['configs']['use']]

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :path => "install/memcached.sh"
  config.vm.provision :shell, :path => "install/composer.sh"
  config.vm.provision :shell, :path => "install/nodejs.sh"
  config.vm.provision :shell, :path => "install/redis.sh"
  config.vm.provision :shell, :path => "install/mailutils.sh"

  config.vm.network "private_network", ip: vagrant_config['public_ip']

  config.vm.synced_folder "./etc", "/etc/vagrant", owner: "vagrant", group: "vagrant"
  config.vm.synced_folder "./sites", "/var/www", owner: "vagrant", group: "vagrant"
  config.vm.synced_folder "./scripts", "/scripts", owner: "vagrant", group: "vagrant"

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
end
