class demo::apt {
  notify {'demo::apt run before Stage[main]': }

  exec { 'apt_get_update':
    command     => 'apt-get update',
    refreshonly => true
  }
}
