<?php

    //get the default application's logger:
    $logger = __ApplicationContext::getInstance()->getLogger();
    //log in debug mode:
    $logger->debug('This is a debug message');