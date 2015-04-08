class dojo::role::mongo (
  $list_of_packages,
  $kernel_customization = undef
){
  create_resources(package, $list_of_packages)

  if $kernel_customization != undef {
    create_resources(file, $kernel_customization)
  }

  service { 'mongod':
    ensure => running
  }
}
