Vagrant puppet
======

My vagrant for made Kata in several languages, now is only PHP and Ruby.
The first goal was to made a Kata for develop knowledge to puppet provisioner and to have an instance for develop Kata.

Setup:
---

Requirements:
 - Vagrant >= 1.6.5
 - Virtualbox latest version

Plugin needed:
 - vagrant plugin install vagrant-cachier
 
Running:
---

Now there is only one instance, dev-php
For use it:
```
vagrant up dev-php
```

What's inside:
---

Installed software for all instance name:

dev-php
  - Php 5.6.5
  - Apache 2.4
  - Git
  - Vim
