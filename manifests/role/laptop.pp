class puppet::role::laptop inherits puppet::role::params {

  # Base Stuff
  require puppet::profile::base
  require puppet::profile::laptop
  require puppet::profile::dotfiles

  # Specific Work Stuff
  require puppet::profile::playonlinux

  # Development
  require puppet::profile::rvm
}
