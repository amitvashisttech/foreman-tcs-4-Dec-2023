class apache {

 class { 'apache::install': } -> class {'apache::deploy':} ->  class { 'apache::service': } 
}
