class profiles::vhost3 {

 ## Hiera lookups
  $vhost_fqdn           = hiera('profiles::vhost3::vhost_fqdn')
  $vhost_docroot        = hiera('profiles::vhost3::vhost_docroot')
  $vhost_port           = hiera('profiles::vhost3::vhost_port')
  $www_user             = hiera('profiles::apache::www_user')
  $www_group             = hiera('profiles::apache::www_group')

file { "$vhost_docroot":
  ensure  =>  directory,
  owner   =>  "$www_user",
  group   =>  "$www_group",
  mode    =>  0755,
}

apache::vhost { "$vhost_fqdn":
  port    => "$vhost_port",
  docroot => "$vhost_docroot",
}

file { "$vhost_docroot/index.html":
  ensure  =>  file,
  content =>  "$vhost_fqdn",
}

}
