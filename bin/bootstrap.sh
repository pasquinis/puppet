#!/bin/bash

if [ ! -f /var/tmp/puppetlabs-release-precise.deb ];
then
    wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb -P /var/tmp
    sudo dpkg -i /var/tmp/puppetlabs-release-precise.deb
    sudo apt-get update
    sudo apt-get install -y puppet=3.7.4-1puppetlabs1
else
    echo Puppet already installed
fi

echo "Installing hiera"
sudo puppet resource package hiera ensure=1.3.4-1puppetlabs1

echo "Installing hiera-eyaml"
sudo puppet resource package hiera-eyaml provider=gem ensure=2.0.6

echo "Installing software-properties-common"
sudo puppet resource package software-properties-common ensure=present

echo "Installing python-software-properties"
sudo puppet resource package python-software-properties ensure=present

#Fix environment
if [ $(cat /etc/environment | grep LC_ALL|wc -l) -eq 0 ];
then
    sudo sh -c 'echo LC_ALL="en_US.UTF-8" >> /etc/environment'
    sudo sh -c 'locale-gen en_US.UTF-8'
fi

#Useful for disable templatedir warning
sed -i 's/^templatedir/#templatedir/' /etc/puppet/puppet.conf
