<?php

    //get the resource manager associated to our application:
    $resource_manager = __ApplicationContext::getInstance()
                        ->getResourceManager();

    //get the welcome literal and set Antonio to the {0} placeholder:
    $welcome_literal = $resource_manager->getResource('welcome')
                       ->setParameters(array('Antonio'))
                       ->getValue();
                       
    