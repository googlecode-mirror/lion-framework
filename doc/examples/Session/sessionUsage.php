<?php

    //get the session:
    $session = __ApplicationContext::getInstance()->getSession();
    //if a data already exists in session
    if($session->hasData('data')) {
        //get data from session
        $data = $session->getData('data');
    }
    else {
        //retrieve data from database:
        $data = eg_retrieve_data_from_database();
        //store data to session once, so next time won't be needed to
        //get it from the database but from the session:
        $session->setData('data', $data);
    }
    