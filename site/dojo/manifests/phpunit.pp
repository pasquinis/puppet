class dojo::phpunit {
  exec { 'install PHPUnit':
    cwd     => '/usr/local/bin',
    command => '/usr/bin/wget -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar',
    creates => '/usr/local/bin/phpunit'
  } ->
  file { '/usr/local/bin/phpunit':
    mode => '0755'
  }
}
