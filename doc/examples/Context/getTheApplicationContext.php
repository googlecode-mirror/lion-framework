<?php

//get the application context:
$application_context = __ApplicationContext::getInstance();

//get the context configuration:
$configuration = $application_context->getConfiguration();

//get the context session:
$session = $application_context->getSession();

//get the context cache:
$cache = $application_context->getCache();
