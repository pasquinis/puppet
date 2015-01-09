class demo::ruby {

  $given_key = 'D39DC0E3'
  $ruby_version = '1.9.3'
  exec { 'install RVM gpg':
    command => "gpg --keyserver hkp://keys.gnupg.net --recv-keys ${given_key}",
    onlyif  => "test $(gpg --list-keys | grep -c ${given_key}) -eq 0"
  } ->
  exec { 'install RVM with bash':
    cwd     => '/usr/local',
    command => 'curl -sSL https://get.rvm.io | bash -s stable ; mkdir -p /usr/local/rvm',
    creates => '/usr/local/rvm'
  } ->
  exec { "install with RVM ruby version ${ruby_version}":
    command => "rvm install ${ruby_version} > /var/tmp/ruby-wrong 2>&1",
    onlyif  => "test $(rvm list|grep -c ruby-${ruby_version}) -eq 0",
    timeout => 1800
  }
}
