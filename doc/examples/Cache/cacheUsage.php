<?php

    //get the cache handler:
    $cache = __ApplicationContext::getInstance()->getCache();
    //get data from the cache:
    $data = $cache->load('data');
    //if no data:
    if($data === null) {
        //retrieve data from database:
        $data = eg_retrieve_data_from_database();
        //store data to cache, so next time won't be needed to
        //get it from the database but from the cache:
        $cache->setData('data', $data);
    }
    