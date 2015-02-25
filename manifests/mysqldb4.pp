class profiles::mysqldb4 {
$mysql_user		=	hiera(profiles::mysqldb4::mysql_user)
$mysql_pass		=	hiera(profiles::mysqldb4::mysql_pass)

mysql::db { 'mysqldb4':
  user     => "$mysql_user",
  password => "$mysql_pass",
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
}

}
