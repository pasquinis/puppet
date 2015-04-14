class dojo::mongo (
  $list_of_packages,
){
  service { 'mongod':
    ensure => running
  }

  create_resources(package, $list_of_packages)

  exec { 'disable mongo WARNING for transparent_hugepage ENABLED':
    command => 'echo never > /sys/kernel/mm/transparent_hugepage/enabled',
    unless  => 'grep -c \'\[never\]\' /sys/kernel/mm/transparent_hugepage/enabled',
    notify  => Service['mongod']
  }
  exec { 'disable mongo warning for transparent_hugepage DEFRAG':
    command => 'echo never > /sys/kernel/mm/transparent_hugepage/defrag',
    unless  => 'grep -c \'\[never\]\' /sys/kernel/mm/transparent_hugepage/defrag',
    notify  => Service['mongod']
  }
}
