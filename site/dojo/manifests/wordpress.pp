class dojo::wordpress (
  $version
){
  exec { "I download the wordpress version ${version}":
    cwd     => '/var/tmp',
    command => "/usr/bin/wget -k -O /var/tmp/latest-wordpress.tar.gz https://wordpress.org/wordpress-${version}.tar.gz",
    creates => '/var/tmp/latest-wordpress.tar.gz'
  }
}
