#!/bin/bash

if [ ! -f /var/tmp/puppetlabs-release-precise.deb ];
then
    wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb -P /var/tmp
    sudo dpkg -i /var/tmp/puppetlabs-release-precise.deb
    sudo apt-get update
    sudo apt-get install -y puppet
else
    echo Puppet already installed
fi

#Fix environment
if [ $(cat /etc/environment | grep LC_ALL|wc -l) -eq 0 ];
then
    sudo sh -c 'echo LC_ALL="en_US.UTF-8" >> /etc/environment'
fi

#Useful for disable templatedir warning
sed -i 's/^templatedir/#templatedir/' /etc/puppet/puppet.conf
