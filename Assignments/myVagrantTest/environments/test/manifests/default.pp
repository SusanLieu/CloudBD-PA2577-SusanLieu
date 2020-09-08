exec { 'apt-get update':
 command => '/usr/bin/apt-get update'
}

package { 'curl':
    ensure => 'installed',
    command => '/usr/bin/sudo apt-get install -y curl',
    require => Exec['apt-get update']
}

exec { 'install script':
    command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -'
}

package { 'nodejs':
    ensure => 'installed',
    require => Exec['install script', 'apt-get update'],
    command => '/usr/bin/sudo apt-get install -y nodejs'
}