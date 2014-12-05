class demo::users {
  user { 'art':
    ensure      => present,
    comment     => 'Art Cart',
    home        => '/home/art',
    managehome  => true
  }
}
