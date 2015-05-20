# -*- mode: ruby -*-
# vi: set ft=ruby :
# vi: set softtabstop=2 :
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.5"
ENV['VAGRANT_DEFAULT_PROVIDER'] ||= 'docker'

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
    :'dev-amp' => {
      :os         => 'ubuntu/trusty64',
      :hostname   => "dev-amp.dojo.com",
      :ip         => "192.168.33.10",
      :memory     => "4096",
      :cpus       => 2,
      :primary    => false,
      :autostart  => false
    }
  }.each do |instance_name, instance_cfg|
    config.vm.define instance_name ,
      primary: instance_cfg[:primary],
      autostart: instance_cfg[:autostart] do |instance|
      instance.vm.hostname = instance_cfg[:hostname]
      instance.vm.network "private_network", ip: instance_cfg[:ip]
    end

    config.vm.provider 'docker' do |d|
      d.build_dir = '.'
      d.name = 'puppet'
      d.has_ssh = true
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
      '--debug'
    ]
  end
end
