class dojo::env::dev {
  include dojo::git
  include dojo::execution

  if $::role == 'php' {
    include dojo::phpunit
  }
}
