<?php

class ProtectedPageController extends __ActionController {

    public function defaultAction() {
        $mav = new __ModelAndView('protectedPage');
        return $mav;
    }
    
    /**
     * This method is just executed on case the user has not
     * the required permission to execute this controller
     * 
     */
    public function onAccessError() {
        //we're going to redirect users without permission to the login page
		$uri = __UriFactory::getInstance()->createUri()->setController("login");		
        __FrontController::getInstance()->forward($uri);
    }

}
