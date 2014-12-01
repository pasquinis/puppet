class demo::nginx {
  package { 'nginx':
    ensure => present
  }
}
