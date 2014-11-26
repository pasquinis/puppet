user { 'katie' :
    ensure  => present,
    home    => '/home/katie',
    shell   => '/bin/bash',
    managehome => true
}
