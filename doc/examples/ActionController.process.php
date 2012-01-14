<?php

class LastAdvertisementsAction extends __ActionController {

     protected function _process()
     {
         //Call to the model to get the lastest 5 advertisements:
         $last_5_advs = __ModelManager::getInstance()->getLastest5Advertisements();
         //Instantiate a __ModelAndView instance, by setting the view code as 'last_advertisements'
         $model_and_view = new __ModelAndView('last_advertisements');
         //Add the last 5 advertisements to the __ModelAndView instance:
         $model_and_view->addObject('last_advertisements', $last_5_advs);
         //Return the __ModelAndView instance:
         return $model_and_view;
     }

}