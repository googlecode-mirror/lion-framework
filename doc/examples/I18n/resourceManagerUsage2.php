<?php

    //get the resource manager associated to our application:
    $resource_manager = __ApplicationContext::getInstance()
                        ->getResourceManager();

    //get the negociated language welcome literal by just 
    //ommiting the language parameter to get the literal from:
    $welcome_literal = $resource_manager->getResource('welcome')
                       ->getValue();
