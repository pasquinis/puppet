class dojo::nginx {

  package { 'apache2':
    ensure => absent
  }

  package { 'nginx':
    ensure  => present,
    require => Package['apache2']
  }

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx']
  }

}
