<?php

//Discompound an url into single elements:
$uri = __UriFactory::getInstance()->
                     createUri('http://yourdomain.com/invoices/10948.html');

$parameters = $uri->getParameters(); 
//--> [invoice_id => 10948]

$controller_code = $uri->getControllerCode(); 
//--> invoices

$action_code = $uri->getActionCode(); 
//--> default

$route_id = $uri->getRouteId(); 
//--> invoice_search

//we can also know which front controller attends the request:
$front_controller_class = $uri->getFrontControllerClass();
//--> __HttpFrontController