class people::jangorman::applications {

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

  class { 'intellij':
    edition: 'ultimate',
    version: '12.1.6'
  }

  # Misc software
  include textexpander
  include alfred
  include transmit
  include skype
  include transmission
  include onepassword
  include dropbox
  include handbrake
  include wunderlist
  include mou
  include vlc

  # Browsers
  include chrome
  include firefox
  include opera

}