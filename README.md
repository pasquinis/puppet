Vagrant puppet
=============

My vagrant is made for  Kata's training in several languages, now is only PHP and Ruby.

The first goal was to make a Kata for enhance my knowledge to Puppet provisioning.

Setup:
------------


Requirements:
 - Vagrant >= 1.6.5
 - Virtualbox latest version

Plugin needed:
 - vagrant plugin install vagrant-cachier

Running:
--------------


Now there is only one instance, dev-php
For use it:
```bash
$ vagrant up dev-php
```

What's inside:
-----------------


Installed software for all instance name:

> **Instances:**
> 
> dev-php:
 * Ubuntu 14.04
 * Php 5.6.X
 * Apache 2.4
 * Git
 * Vim
 >
 > dev-amp:
 * Ubuntu 14.04
 * Php 5.6.X
 * Apache 2.4
 * MongoDB 3.X
 * Git
 * Vim

## Stuff used to make this:
 * [puppet](https://puppetlabs.com/)

