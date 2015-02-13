class profiles::mysqlserver {

  $mysqlrootpassword      = hiera('profiles::mysqlserver::rootpassword')

class { '::mysql::server':
    root_password           => "$mysqlrootpassword",
}


}
