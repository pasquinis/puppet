Vagrant puppet
=============

My vagrant is made for  Kata's training in several languages or configurations,now are:
> **Instances**
- dev-php
- dev-amp
- dev-ruby

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
 >
 > dev-ruby:
 * Ubuntu 14.04
 * Ruby 2.2.2
 * Git
 * Vim


## Stuff used to make this:
 * [puppet](https://puppetlabs.com/)



### Setting up Git

* Tell Git your _name_ so your commits will be properly labeled. Type everything after the `$` here:
 
```$ git config --global user.name "YOUR NAME"```
* Tell Git the _email address_ that will be associated with your Git commits.
 
```$ git config --global user.email "YOUR EMAIL ADDRESS"```

### Testing your Git SSH connection

```bash
$ ssh -T git@github.com
Hi pasquinis! You've successfully authenticated, but GitHub does not provide shell access.
```
