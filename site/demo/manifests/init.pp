class demo {
  include demo::nginx

  file { '/tmp/test':
    content => 'A test file\n'
  }
}
