class dojo::env::dev {
  include dojo::git

  if $::role == 'php' {
    include dojo::phpunit
  }
}
