class people::jangorman {

  include osx::finder::show_external_hard_drives_on_desktop
  include osx::software_update

  # Development
  include java
  include heroku
  include zsh
  include appcode2
  include rubymine
  include viscosity
  include textmate::textmate2::nightly
  include virtualbox
  include simpholders

  class { 'intellij':
    edition => 'ultimate',
    version => '12.1.6'
  }

  # Misc software
  include textexpander
  include alfred
  include transmit
  include skype
  include transmission
  include dropbox
  include handbrake
  include mou
  include vlc
  include spotify
  include ohmyzsh
  include littlesnitch

  # Browsers
  include chrome
  include firefox
  include opera
  
  
  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"
  
  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'JanGorman/dotfiles',
    require => File[$my]
  }
  
  exec { "install dotfiles":
    provider => shell,
    command  => "./script/install",
    cwd      => $dotfiles,
    creates  => "${home}/.zshrc",
    require  => Repository[$dotfiles],
  }
  
  # Homebrew
  package {
    [
      'autojump',
      'ffind',
      'mackup',
      'maven',
      'most',
      'pigz',
      'the_silver_searcher',
      'tig',
      'unp',
      'cloc',
      'gist',
      'git-extras',
      'ledger',
      'zsh-completions'
    ]:
    ensure => 'present'
  }
  
  class security inherits boxen::security {
    Boxen::Osx_defaults['short delay for password dialog on screensaver'] {
      value  => 3600,
    }
  }

  include security

}