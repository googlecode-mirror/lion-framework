<?php

class LastAdvertisementsAction extends __ActionController {

     protected function _postProcess()
     {
         __ActionControllerFactory::getInstance()->createAction('footer')->execute(); 
     }

}