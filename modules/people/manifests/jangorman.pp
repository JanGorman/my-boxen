include poeple::jangorman::applications

class people::jangorman {
  
  notify { 'class people::jangorman declared': }

  # Changes the default shell to the zsh version we get from Homebrew
  # Uses the osx_chsh type out of boxen/puppet-osx
  osx_chsh { $::luser:
    shell   => '/opt/boxen/homebrew/bin/zsh',
    require => Package['zsh']
  }
  
  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${boxen::config::homebrewdir}/bin/zsh",
    require => Package['zsh']
  }
  
  ##################################
  ## Facter, Puppet, and Envpuppet##
  ##################################

  repository { "${::boxen_srcdir}/puppet":
    source => 'puppetlabs/puppet'
  }

  repository { "${::boxen_srcdir}/facter":
    source => 'puppetlabs/facter'
  }

  file { '/bin/envpuppet':
    ensure  => link,
    mode    => '0755',
    target  => "${::boxen_srcdir}/puppet/ext/envpuppet",
    require => Repository["${::boxen_srcdir}/puppet"]
  }

}