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


    notify { "database_name ${database_name}": } 
}
