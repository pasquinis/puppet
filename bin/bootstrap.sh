#!/bin/bash

if [ ! -f /tmp/puppetlabs-release-precise.deb ];
then
    wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb -P /tmp
    sudo dpkg -i /tmp/puppetlabs-release-precise.deb
    sudo apt-get update
    sudo apt-get install -y puppet
else
    echo Puppet already installed
fi
