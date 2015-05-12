class dojo::wordpress_setup (
  $version,
  $database_name,
  $username,
  $password,
  $documentroot,
){

  exec { "I download the wordpress version ${version}":
    cwd     => '/var/tmp',
    command => "/usr/bin/wget -k -O /var/tmp/latest-wordpress.tar.gz https://wordpress.org/wordpress-${version}.tar.gz",
    creates => '/var/tmp/latest-wordpress.tar.gz'
  }

  file { 'I prepare mysql_setup.sql for WP MySQL customization':
    ensure  => present,
    path    => '/var/tmp/mysql_setup.sql',
    content => template('dojo/wp/mysql_setup.sql.erb'),
    notify  => Exec['I apply the mysql_setup.sql']
  }

  exec { 'I apply the mysql_setup.sql':
    command     => 'mysql -u root < /var/tmp/mysql_setup.sql',
    refreshonly => true
  }

  exec { "I extract wordpress to ${documentroot}":
    cwd     => '/var/www',
    command => "mkdir -p /var/www/${documentroot} && tar -xvzf /var/tmp/latest-wordpress.tar.gz -C /var/www/${documentroot} --strip 1",
    creates => "/var/www/${documentroot}"
  }
}
