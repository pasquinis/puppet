class demo::ppa {
  notify {'demo::ppa run before Stage[apt]': }

  exec {'simulation for trigger apt-get update only once':
    command => 'touch /tmp/only_once',
    creates => '/tmp/only_once',
    notify  => Exec['apt_get_update']
  }
}
