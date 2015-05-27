node basenode {
  # define init stage
  stage { 'init': before => Stage['main'] }

  # define last stage
  stage { 'last': }
  Stage['main'] -> Stage['last']

  # autoupdate ubuntu packages
  class { 'ubuntu-update':
    stage => 'init'
  }

  # install swap file
  # swapfile { "/mnt/swap1":
  #   ensure => present,
  #   swapfile => '/mnt/swap1'
  # }

  # set timezone
  class { 'timezone':
    timezone => 'Europe/Paris',
  }
}