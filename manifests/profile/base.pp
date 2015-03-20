# My Default profile, which is called regardless of host

class puppet::profile::base inherits puppet::profile::params {
  require puppet::profile

  package { $base_packages:
    ensure  => "installed",
  }

}
