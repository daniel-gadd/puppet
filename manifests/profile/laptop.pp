class puppet::profile::laptop inherits puppet::profile::params {
  require puppet::profile

  # Install My Packages I like
  package { [
             'terminator',
             'i3',
             'lm-sensors',
             'htop',
             'nginx',
             'postgresql',
             'cmatrix',
             'vlock',
             'docker',
             'vagrant',
             'fail2ban',
             'sshfs',
             'thunar',
             'build-essentials',
             'tree',
             'keepassx',
             'pidgin',
             'pidgin-otr',
            ]:
    ensure  => "installed",
  }

}
