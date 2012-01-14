<?php

class __SecurityException extends __LionException{    
    //If a security exception has produced, will logout the
    //user inmediately:
    public function ExecuteCustomAction() {
        __AuthenticationManager::getInstance()->logout();
    }
}
