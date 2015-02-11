class demo {

  class { 'demo::ppa':
    stage => ppa
  }

  class { 'demo::apt':
    stage => apt
  }

  if $::env {
    #include "demo::${::env}"
  }

  if $::role {
    include "demo::role::${::role}"
  }

  #include demo::nginx
  #include demo::catsite
  include demo::users
  include demo::execution
  ##include demo::git
}
