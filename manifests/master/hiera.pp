class profiles::master::hiera {

class { 'hiera':
  backends  => [
    'yaml',
    'eyaml',
  ],
  hierarchy => [
    '%{clientcert}',
    '%{environment}',
    'common',
  ],
  eyaml_extension  => 'yaml',
  datadir          => '/etc/puppetlabs/puppet/environments/%{environment}',

}


}
