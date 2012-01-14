<?php

/**
 * This class has 2 special methods: preExecute and
 * postExecute
 *
 */
class FooBarController extends __ActionController {
    
    /**
     * This method will be executed BEFORE any action on 
     * this controller. 
     *
     */
    public function preExecute() {
        //common code here
    }

    /**
     * This method will be executed AFTER any action on this 
     * controller (even after the view execution if case 
     * action returns a __ModelAndView instance).
     *
     */
    public function postExecute() {
        //common code here
    }
    
}