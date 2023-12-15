node 'katello-foreman.example.com' {

  class {'linux':}

}




class linux {


 file { '/etc/motd':

   ensure => 'present',

   content => 'This Host is Manged by Puppet.!!',

 }



 file { '/info.txt':

   ensure => 'present',

   content => inline_template("Craete by Puppet <%= Time.now %>\n"),

 }



 $adminpkg = ['git','tree','vim','ntp']



 package { $adminpkg:

   ensure => 'installed',

 }



$ntpservice = $osfamily ? {

  'redhat' => 'ntpd',

  'debian' => 'ntp',

   default => 'ntpd',

}


service { $ntpservice:

  ensure => 'running',

  enable => 'true',

 }



}
