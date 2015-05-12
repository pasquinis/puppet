class dojo::wordpress_setup (
  $version,
  $database_name,
  $username,
  $password
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
}