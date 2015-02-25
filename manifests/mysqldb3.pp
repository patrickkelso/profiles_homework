class profiles::mysqldb3 {
$mysql_user		=	hiera(profiles::mysqldb3::mysql_user)
$mysql_pass		=	hiera(profiles::mysqldb3::mysql_pass)

mysql::db { 'mysqldb3':
  user     => "$mysql_user",
  password => "$mysql_pass",
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
}

}
