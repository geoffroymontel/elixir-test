class ubuntu-update {
  exec { "apt-get update":
      command => "/usr/bin/apt-get update -y",
      onlyif  => "/bin/sh -c '[ ! -f /var/cache/apt/pkgcache.bin ] || /usr/bin/find /etc/apt/* -cnewer /var/cache/apt/pkgcache.bin | /bin/grep . > /dev/null'",
  }

  package { "unattended-upgrades":
    ensure    => installed,
  }

  file { "/etc/apt/apt.conf.d/50unattended-upgrades":
    owner   => root,
    group   => root,
    mode    => 644,
    ensure  => present,
    source  => "puppet:///modules/ubuntu-update/50unattended-upgrades",
  }

  file { "/etc/apt/apt.conf.d/10periodic":
    owner   => root,
    group   => root,
    mode    => 644,
    ensure  => present,
    source  => "puppet:///modules/ubuntu-update/10periodic",
  }
}
