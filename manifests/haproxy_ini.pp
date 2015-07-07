class profiles::haproxy_ini {

ini_setting { "sample setting":
  ensure  => present,
  path    => '/tmp/foo.ini',
  section => 'bar',
  setting => 'baz',
  value   => 'quux',
}


}
