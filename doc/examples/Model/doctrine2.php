<?php

$conn = $manager->openConnection(
'mysql://username:password@localhost/dbname', 'connection 1');

$conn2 = $manager->openConnection(
'mysql://username2:password2@localhost/dbname2', 'connection 2');

$manager->bindComponent('User', 'connection 1');

$manager->bindComponent('Group', 'connection 2');

$q = Doctrine_Query::create();

// Doctrine uses 'connection 1' for fetching here
$users = $q->from('User u')->where('u.id IN (1,2,3)')->execute();

// Doctrine uses 'connection 2' for fetching here
$groups = $q->from('Group g')->where('g.id IN (1,2,3)')->execute();

?>