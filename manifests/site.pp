File {
  owner => 'root',
  group => 'root'
}

Exec {
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/rvm/bin'
}

stage { 'ppa':
  before => Stage['apt']
}

stage { 'apt_key':
  before => Stage['apt']
}

stage { 'apt':
  before => Stage['main']
}

include dojo
