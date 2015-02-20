class dojo {

  class { 'dojo::ppa':
    stage => ppa
  }

  class { 'dojo::apt':
    stage => apt
  }

  if $::env {
    include "dojo::env::${::env}"
  }

  if $::role {
    include "dojo::role::${::role}"
  }

  #include dojo::nginx
  #include dojo::catsite
  include dojo::users
  include dojo::execution
}
