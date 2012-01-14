<?php

class MyOwnErrorPrinter implements __IErrorPrinter {

    public function displayError(Exception $exception) {
        $request = $this->_getRequest($exception);
        $action_identity = new __ActionIdentity('yourOwnErrorControllerCodeHere');
        $response = __FrontController::getInstance()->getResponse();
        if($response != null) {
            $response->clear(); 
            $response = __ActionDispatcher::getInstance()->dispatch($action_identity, $request, $response);
            $response->flushAll();
        }
        else {
            print "Unknown Error";
        }
        exit;
    }
    
}