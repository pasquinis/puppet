# -*- mode: ruby -*-
# vi: set ft=ruby :
# vi: set softtabstop=2 :
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.5"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  config.vm.provision :shell, path: "bin/bootstrap.sh"
  config.vm.synced_folder "./bridge", "/mnt/bridge" , create: 'true'
  config.vm.synced_folder "./site/dojo/templates", "/tmp/puppet/templates" , create: 'true'
  config.vm.synced_folder "./site/dojo/lib/facter", "/var/lib/puppet/lib/facter", create: 'true'
  config.vm.box_check_update = false

  {
    :'dev-php' => {
      :os         => 'ubuntu/trusty64',
      :hostname   => "dev-php.dojo.com",
      :ip         => "192.168.33.10",
      :memory     => "4096",
      :cpus       => 2,
      :primary    => true,
      :autostart  => true
    },
    :'dev-ammp' => {
      :os         => 'ubuntu/trusty64',
      :hostname   => "dev-ammp.dojo.com",
      :ip         => "192.168.33.10",
      :memory     => "4096",
      :cpus       => 2,
      :primary    => false,
      :autostart  => false
    }
  }.each do |instance_name, instance_cfg|
    config.vm.define instance_name , instance_cfg[:primary], instance_cfg[:autostart] do |instance|
      instance.vm.box = instance_cfg[:os]
      instance.vm.hostname = instance_cfg[:hostname]
      instance.vm.network "private_network", ip: instance_cfg[:ip]
    end

    config.vm.provider "virtualbox" do |vb|
      # Don't boot with headless mode
      vb.gui = false

      # Use VBoxManage to customize the VM. For example to change memory:
      vb.customize ["modifyvm", :id, "--memory", instance_cfg[:memory]]
      vb.cpus = instance_cfg[:cpus]
      # virtualbox parameter CPU execution cap is 50%
      #vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifest_file  = "site.pp"
    puppet.hiera_config_path = "etc/hiera.eyaml"
    puppet.module_path = [ "site", "modules" ]
    puppet.options = [
      '--templatedir', '/tmp/puppet/templates',
      '--verbose',
      '--show_diff',
      #'--graph',
      #'--debug'
    ]
  end

end
