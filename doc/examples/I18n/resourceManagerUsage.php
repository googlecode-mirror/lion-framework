<?php

    //get the resource manager associated to our application:
    $resource_manager = __ApplicationContext::getInstance()
                        ->getResourceManager();

    //get the english welcome literal:
    $welcome_literal = $resource_manager->getResource('welcome', 'en')
                       ->getValue();
                       
    