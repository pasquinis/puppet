class demo {

  class { 'demo::ppa':
    stage => ppa
  }

  class { 'demo::apt':
    stage => apt
  }

  #include demo::nginx
  #include demo::catsite
  include demo::users
  include demo::execution
  ##include demo::ruby
  ##include demo::php
  ##include demo::git
}
