class puppet::profile::rvm inherits puppet::profile::params::rvm {
  require puppet::profile

  package { $ruby_packages:
    ensure => 'installed',
    before => Exec['install-rvm'],
  }

  exec { 'install-rvm-gpg-key':
    path        => '/usr/bin:/usr/sbin:/bin',
    command     => 'gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3',
    user        => "daniel",
    unless      => 'gpg2 --list-keys D39DC0E3',
    require     => Package['gnupg2'],
  }

  exec { 'install-rvm':
    command     => "curl -L https://get.rvm.io | bash -s stable",
    path        => '/usr/bin:/usr/sbin:/bin',
    creates     => "/home/daniel/.rvm/bin/rvm",
    user        => 'daniel',
    provider    => 'shell',
    environment => "HOME=/home/daniel",
    require     => Exec['install-rvm-gpg-key'],
  }

  exec { "install-ruby-ruby-2.1.5":
    command     => "/home/daniel/.rvm/bin/rvm install ruby-2.1.5 --autolibs=disable",
    path        => '/usr/bin:/usr/sbin:/bin',
    creates     => "/home/daniel/.rvm/rubies/ruby-2.1.5",
    user        => 'daniel',
    provider    => 'shell',
    environment => "HOME=/home/daniel",
    timeout     => '3400',
    require     => Exec['install-rvm'],
  }
}
