class demo {

  class { 'demo::apt':
    stage => apt
  }

  include demo::nginx
  include demo::catsite
  include demo::users
  include demo::execution
  include demo::ruby
  include demo::git
}
