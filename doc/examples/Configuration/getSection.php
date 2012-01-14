<?php

//get an array of Foo instances according
//to the configuration:
$foos = __ApplicationContext::getInstance()->
                              getConfiguration()->
                              getSection('foobars');

