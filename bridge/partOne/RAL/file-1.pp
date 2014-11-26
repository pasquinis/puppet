file { 'testfile':
    ensure  => present,
    path    => '/tmp/testfile',
    mode    => 0644,
    content => "I'am a test file.!"
}
