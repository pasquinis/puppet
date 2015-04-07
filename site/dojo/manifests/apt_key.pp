class dojo::apt_key {

  if $::role == 'ammp' {
    exec {'I install public key for mongodb':
      command => 'apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10',
      unless  => 'apt-key list | grep 7F0CEB10'
    }
  }
}
