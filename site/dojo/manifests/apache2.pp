class dojo::apache2 {
  service { 'apache2':
    ensure => running,
    enable => true
  }
}
