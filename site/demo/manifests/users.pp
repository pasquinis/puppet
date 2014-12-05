class demo::users {
  user { 'art':
    ensure      => present,
    comment     => 'Art Cart',
    home        => '/home/art',
    managehome  => true,
    password    => '*'
  } ->
  ssh_authorized_key { 'art_ssh':
    user  => 'art',
    type  => 'rsa',
    key   => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCcpKHaR6iqRK2V4JHkPyt5FI+pXhVCbX5BjDWiEOXoVKIVTGDKofqFl+E5QvlzvBsWyjEnasaqTh8fSTxuaQS8aIHGbkSwe0yXNpIaeHCV0iejSMTJlRrlKq4riZuihjWQee7AzSi5lDNlQlCKBxDQqDNa0jIBc6dW1Io15Y6ZuJmyliCOQdi1iSDLv5/KCrG/zs6JivSGS1T2rpCnrWGP8I+4684a4a4uX3YT3yNtl6ZCRgOyGCfb3WNlnAIGZuL6pyo3NhFTpODs/Bj4w9WNb4TYpCWnLAry8BP8T/ysv2olvWReC2P1AcUirh9ICr2RM4bfrP63Z05PWN/Rhnm3'
  }
}
