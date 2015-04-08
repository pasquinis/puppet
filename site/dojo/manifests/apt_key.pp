class dojo::apt_key {

  if $::role == 'amp' {
    exec { 'I install public key for mongodb':
      command => 'apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10',
      unless  => 'apt-key list | grep 7F0CEB10'
    } ->
    exec { 'I create a list file for mongodb':
      command => 'echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list',
      creates => '/etc/apt/sources.list.d/mongodb-org-3.0.list'
    }
  }
}
