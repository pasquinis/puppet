file { 'motd' :
    ensure  => present,
    path    => '/var/run/motd',
    content => 'Welcome to puppet provisioning',
    mode    => 0644
}
