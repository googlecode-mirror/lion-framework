<?php

class MyFilter extends __Filter {
    
    /**
     * This method is executed BEFORE giving the control to the front controller
     * 
     */
    public function preFilter(__IRequest &$request, __IResponse &$response) {
        ...
    }

    /**
     * This method is executed AFTER giving the control to the front controller
     * 
     */
    public function postFilter(__IRequest &$request, __IResponse &$response) {
        ...
    }
    
}