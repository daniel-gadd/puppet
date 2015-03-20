class puppet::profile::playonlinux inherits puppet::profile::params {
  require puppet::profile

  # Setup apt repo

  exec {'get_playonlinux_apt_key':
    command => "wget -q \"http://deb.playonlinux.com/public.gpg\" -O- | sudo apt-key add -",
    path    => ["/usr/bin", "/usr/sbin"],
    unless  => "apt-key list | /bin/grep PlayOnLinux",
    notify  => Exec['add_playonlinux_repo_sources_list'],
  }

  exec {'add_playonlinux_repo_sources_list':
    command => "wget http://deb.playonlinux.com/playonlinux_${lsbdistcodename}.list -O /etc/apt/sources.list.d/playonlinux.list",
    path    => ["/usr/bin", "/usr/sbin"],
    creates => "/etc/apt/sources.list.d/playonlinux.list",
    notify  => [
                Exec['apt-get-update'],
                Package['playonlinux'],
               ]
  }

  exec {'apt-get-update':
    command     => 'apt-get update',
    path        => ["/usr/bin", "/usr/sbin"],
    refreshonly => true,
  }

  package {['playonlinux', 'wine']:
    ensure => installed,
  }
}
