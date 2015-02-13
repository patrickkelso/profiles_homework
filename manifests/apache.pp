class profiles::apache {

class { '::apache':
  mpm_module => 'prefork',
  }
include apache::mod::php

}
