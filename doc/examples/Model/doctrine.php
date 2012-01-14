<?php

$dsn = 'mysql:dbname=testdb;host=127.0.0.1';
$user = 'dbuser';
$password = 'dbpass';

try {
    $dbh = new PDO($dsn, $user, $password);
    $conn = Doctrine_Manager::connection($dbh);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}

?>