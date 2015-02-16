class profiles::mysqldb1 {
$mysql_user		=	hiera(profiles::mysqldb1::mysql_user)
$mysql_pass		=	hiera(profiles::mysqldb1::mysql_pass)

mysql::db { 'mysqldb1':
  user     => "$mysql_user",
  password => "$mysql_pass",
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
}

}
