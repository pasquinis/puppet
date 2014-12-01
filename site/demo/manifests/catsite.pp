class demo::catsite {

  file { ['/var/www', '/var/www/cat-pictures']:
    ensure => directory
  } ->
  file { '/var/www/cat-pictures/index.html':
    ensure  => present,
    content => 'Can I have a cat pictures?'
  } ->
  file { '/etc/nginx/sites-enabled/default':
    ensure => present,
    source => 'puppet:///modules/demo/cat-pictures.conf',
    notify => Service['nginx']
  }

}
