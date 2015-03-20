## Class to Call profiles based on Hostname

import 'init.pp'
import 'params.pp'
import 'profile/*.pp'
import 'profile/params/*.pp'
import 'profile.pp'
import 'role/*.pp'
import 'role.pp'

node default {
  notify {"${::hostname} fell through classification, applying base config only.":}
  require puppet::role::base
}

node 'daniel-MacBookPro' {
  require puppet::role::laptop
}

node 'raspberry-pi' {
  require puppet::role::raspberrypi
}
