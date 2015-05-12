class dojo::wordpress (
  $version,
  $database_name,
  $username,
  $password,
  $documentroot
){
  class { dojo::wordpress_setup:
    version         => $version,
    database_name   => $database_name,
    username        => $username,
    password        => $password,
    documentroot    => $documentroot
  }
}
