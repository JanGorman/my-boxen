class people::JanGorman {
  service {"dev.nginx":
    ensure => "stopped",
  }
  service {"dev.dnsmasq":
    ensure => "stopped",
  }
}