<?php

/**
 * This is our action controller to handle the hello world action
 *
 */
class HelloWorldController extends __ActionController {
    
    /**
     * The hello world action. It just put the message 'Hello world'
     * in a __ModelAndView instance and returns it.
     * 
     */
    public function helloWorldAction()
    {
        //create a new __ModelAndView instance
        $model_and_view = new __ModelAndView();
        //get the 'Hello world' message from the model:
        $model_and_view->hello_world_message = 
                __ModelProxy::getInstance()->getHelloWorldString();
        //returns the __ModelAndView
        return $model_and_view;
    }
       
}