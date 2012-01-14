<?php

class myActionController extends __ActionController {

     protected function _preProcess()
     {
         __ActionControllerFactory::getInstance()->createAction('header')->execute(); 
     }

}