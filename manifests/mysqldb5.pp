class profiles::mysqldb5 {
$mysql_user		=	hiera(profiles::mysqldb5::mysql_user)
$mysql_pass		=	hiera(profiles::mysqldb5::mysql_pass)

mysql::db { 'mysqldb5':
  user     => "$mysql_user",
  password => "$mysql_pass",
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
}

}
