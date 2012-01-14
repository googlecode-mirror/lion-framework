if($error_authentication)) {

    throw __ExceptionFactory::getInstance()
          ->createException('ERR_WRONG_USERNAME_OR_PASSWORD');

}