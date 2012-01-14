<?php

    $q = Doctrine_Query::create();
    
    // Doctrine uses 'connection 1' for fetching here
    $users = $q->from('User u')->where('u.id IN (1,2,3)')->execute();
    
    // Doctrine uses 'connection 2' for fetching here
    $groups = $q->from('Group g')->where('g.id IN (1,2,3)')->execute();
 