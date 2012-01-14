<?php

/**
 * This controller support the actions 'foo' and 'bar'.
 * It also implements a default action to be executed in
 * case no actions are specified.
 *
 */
class FooBarController extends __ActionController {
    
    /**
     * This method will be executed just if the controller 
     * has been executed without specifying any action:
     *
     */
    public function defaultAction() {
        //the code of default action here
    }
    
    /**
     * This method will be executed if the specified action 
     * is 'foo'
     *
     */
    public function fooAction() {
        //the code of 'foo' action here
    }
    
    /**
     * This method will be executed if the specified action 
     * is 'bar'
     *
     */
    public function barAction() {
        //the code of 'bar' action here
    }
    
}