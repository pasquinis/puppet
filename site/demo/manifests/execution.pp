class demo::execution {
  exec { 'I run always this exec':
    command => 'echo I am starting `date` >> /tmp/output.always.txt'
  }

  exec { 'I download this file only once':
    cwd     => '/tmp',
    command => 'wget -k https://raw.githubusercontent.com/pasquinis/dotfiles/master/scripts/install_vim_plugins.sh',
    creates => '/tmp/install_vim_plugins.sh'
  }
}
