<?php

/**
 * This is our action controller to handle the hello world action
 *
 */
class HelloWorldController extends __ActionController {
    
    /**
     * The default action. It just set the message 'Hello world'
     * in a __ModelAndView instance and returns it.
     * 
     */
    public function defaultAction()
    {
        //create a new __ModelAndView instance
        $model_and_view = new __ModelAndView();
        //Add the 'hello world' message to the __ModelAndView:
        $model_and_view->hello_world_message = 'Hello world';
        //returns the __ModelAndView
        return $model_and_view;
    }
       
}