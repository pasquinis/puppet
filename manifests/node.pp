node 'demo' {
  file { '/tmp/test':
    content => 'A test file\n'
  }
}
