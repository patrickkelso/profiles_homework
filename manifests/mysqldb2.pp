class profiles::mysqldb2 {
$mysql_user		=	hiera(profiles::mysqldb2::mysql_user)
$mysql_pass		=	hiera(profiles::mysqldb2::mysql_pass)

mysql::db { 'mysqldb2':
  user     => "$mysql_user",
  password => "$mysql_pass",
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
}

}
