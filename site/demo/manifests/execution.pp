class demo::execution {
  exec { 'I run always this exec':
    command => '/bin/echo I am starting `/bin/date` >> /tmp/output.always.txt'
  }

  exec { 'I download this file only once':
    cwd     => '/tmp',
    command => '/usr/bin/wget -k https://raw.githubusercontent.com/pasquinis/dotfiles/master/scripts/install_vim_plugins.sh',
    creates => '/tmp/install_vim_plugins.sh'
  }
}
