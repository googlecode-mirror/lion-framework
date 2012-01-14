<?php

//Compound an url from single elements:
$uri2 = new __Uri();
$uri2->setControllerCode('invoices');
$uri2->setParameters(array('invoice_id' => 10948));
$uri2->setRouteId('invoice_search');

$url = $uri2->getUrl(); 
//--> /invoices/10948.html

$url = $uri2->getAbsoluteUrl();
//--> http://yourdomain.com/invoices/10948.html