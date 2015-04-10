class dojo::pecl (
  $list_of_packages,
  $list_of_pecl,
){
  create_resources(package, $list_of_packages)
  create_resources(pecl_install, $list_of_pecl)
}

define pecl_install (
  $ensure
){
  $package_name = $title
  $package_version = $ensure
  $pecl_exec_command = "printf \"\n\" | pecl -d preferred_state=stable install -f ${package_name}-${package_version}"
  $pecl_exec_unless = "pecl list|grep ${package_name}|grep ${package_version}"

  exec { "I want manage ${package_name}":
    command   => $pecl_exec_command,
    unless    => $pecl_exec_unless,
    require   => Package['php-pear'],
    notify    => Service['apache2'],
  } ->
  file { "I want add ${package_name}.ini for php":
    ensure  => present,
    path    => "/etc/php5/mods-available/${package_name}.ini",
    content => "extension=${package_name}.so"
  } ->
  file { "I enable for CLI the ${package_name}":
    path   => "/etc/php5/cli/conf.d/${package_name}.ini",
    ensure => link,
    target => "/etc/php5/mods-available/${package_name}.ini"
  } ->
  file { "I enable for APACHE2 the ${package_name}":
    path   => "/etc/php5/apache2/conf.d/${package_name}.ini",
    ensure => link,
    target => "/etc/php5/mods-available/${package_name}.ini"
  }

}
