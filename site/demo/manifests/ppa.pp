class demo::ppa {
  #notify {'demo::ppa run before Stage[apt]': }

  exec { 'execution of add repository for ondrej php5.6':
    command => 'add-apt-repository -y ppa:ondrej/php5-5.6',
    creates => '/etc/apt/sources.list.d/ondrej-php5-5_6-precise.list',
    notify  => Exec['apt_get_update']
  }
}
