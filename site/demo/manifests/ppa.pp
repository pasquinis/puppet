class demo::ppa {
  #notify {'demo::ppa run before Stage[apt]': }

  #exec {'simulation for trigger apt-get update only once':
  #  command => 'touch /tmp/only_once',
  #  creates => '/tmp/only_once',
  #  notify  => Exec['apt_get_update']
  #}

  $content = "# Managed by Puppet
deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu precise main
deb-src http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu precise main
  "
  file {'add ondrej php5-5.6':
    path    => '/etc/apt/sources.list.d/php5-56.list',
    content => $content,
    notify  => Exec['apt_get_update']
  }
}
