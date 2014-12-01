class demo::nginx {

  package { 'apache2':
    ensure => absent
  }

  package { 'nginx':
    ensure  => present,
    require => Package['apache2']
  }

  service { 'nginx':
    ensure => running,
    require => Package['nginx']
  }
}
