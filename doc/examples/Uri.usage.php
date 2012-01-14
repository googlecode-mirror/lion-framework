<?php

//Discompound an url into single elements:
$uri = __UriFactory::getInstance()->createUri('http://mydomain/login.action');
$parameters       = $uri->getParameters();
$controller_code  = $uri->getControllerCode();
$action_code      = $uri->getActionCode();
$route_id         = $uri->getRouteId();
//we can also know which front controller attends the request:
$front_controller_class = $uri->getFrontControllerClass();

//Compound an url from single elements:
$uri2 = new __Uri();
$uri2->setControllerCode($controller_code);
$uri2->setActionCode($action_code);
$uri2->setParameters($parameters);
$uri2->setRouteId($route_id);
$url = $uri2->getUrl(); //will return 'http://mydomain/login.action'