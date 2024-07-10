<?php

$dbHost = getenv('DB_HOST');
$dbUsername = getenv('DB_USER');
$dbPassword = getenv('DB_PASS');
$dbName = getenv('DB_NAME');
$dbPort = getenv('DB_PORT');

//$cfg_dbhost = 'localhost';
//$cfg_dbuser = 'root';
//$cfg_dbpassword = 'root';
//$cfg_database = 'abbchmprmdb1';

$cfg_dbhost = $dbHost;
$cfg_dbuser = $dbUsername;
$cfg_dbpassword = $dbPassword;
$cfg_database = $dbName;
$cfg_port = $dbPort;

?>
