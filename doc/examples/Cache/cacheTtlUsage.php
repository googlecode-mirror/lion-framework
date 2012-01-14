<?php

    //get the cache handler:
    $cache = __ApplicationContext::getInstance()->getCache();
    //save a data to the cache in order to expire 
    //after 5 minutes:
    $cache->setData('data', $data, 300);
