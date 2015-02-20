class dojo::apt {
  #notify {'dojo::apt run before Stage[main]': }

  exec { 'apt_get_update':
    command     => 'apt-get update',
    refreshonly => true
  }
}
