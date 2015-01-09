File {
  owner => 'root',
  group => 'root'
}

Exec {
  path => [
    '/bin',
    '/usr/bin',
    '/sbin',
    '/usr/local/rvm/bin'
  ]
}

include demo
