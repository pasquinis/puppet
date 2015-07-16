class dojo::ruby(
  $version,
  $given_key
) {

  exec { 'install RVM gpg':
    command => "/usr/bin/gpg --keyserver hkp://keys.gnupg.net --recv-keys ${given_key}",
    onlyif  => "/usr/bin/test $(gpg --list-keys | grep -c ${given_key}) -eq 0"
  } ->
  exec { 'install RVM with bash':
    cwd     => '/usr/local',
    command => '/usr/bin/curl -sSL https://get.rvm.io | bash -s stable',
    creates => '/usr/local/rvm/bin/rvm'
  } ->
  exec { "install with RVM ruby version ${version}":
    command => "/usr/local/rvm/bin/rvm install ${version} > /var/tmp/ruby-wrong 2>&1",
    onlyif  => "/usr/bin/test $(rvm list|grep -c ruby-${version}) -eq 0",
    timeout => 1800
  } ->
  package { 'install bundler manager':
    ensure   => present,
    provider => gem,
    name     => 'bundler'
  }
}
