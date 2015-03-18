class dojo::execution {

  $vim_plugins_executions_flag = '/root/.install_vim_plugins'
  exec { 'I download this file only once':
    cwd     => '/tmp',
    command => "wget -k https://raw.githubusercontent.com/pasquinis/dotfiles/master/scripts/install_vim_plugins.sh",
    creates => '/tmp/install_vim_plugins.sh'
  } ->
  exec { 'I install all VIM plugins':
    cwd     => '/root',
    command => "bash /tmp/install_vim_plugins.sh && touch ${vim_plugins_executions_flag}",
    creates => "${vim_plugins_executions_flag}"
  }

}
