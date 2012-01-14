<?php

class __ExecutionException extends __LionException{
    protected $_exception_type = __ExceptionType::NOTICE ;
   
    public function getLogLevel() {
        return __LogLevel::NOT_LOGABLE;        
    }
    
}
