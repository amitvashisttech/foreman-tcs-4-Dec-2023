class motd {
file { '/etc/motd':                                    
  ensure   => 'present',                               
  group    => '0',                                     
  mode     => '0644',                                  
  owner    => '0',                                     
  source   => 'puppet:///modules/motd/motd'           
}                                                      
                                                       

}
