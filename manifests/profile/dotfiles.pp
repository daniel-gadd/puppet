class puppet::profile::dotfiles inherits puppet::profile::params {
  require puppet::profile

  vcsrepo { "/home/daniel/.shell":
    ensure   => latest,
    provider => git,
    source   => 'ssh://git@github.com/daniel-gadd/dotfiles.git',
    revision => 'master',
    notify   => Exec['setup-dotfiles'],
  }

  exec {'setup-dotfiles':
    command     => "/home/daniel/.shell/tools/install.sh",
    refreshonly => true,
  }
}
