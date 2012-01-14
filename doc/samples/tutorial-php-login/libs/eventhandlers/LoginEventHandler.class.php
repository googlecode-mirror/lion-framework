<?php

class LoginEventHandler extends __EventHandler {

    public function login_form_submit(__UIEvent &$event) {
    
        //retrieve the login and password from
        //the components:
        $login = $this->getComponent('login')
                      ->getValue();
        $password = $this->getComponent('password')
                      ->getValue();

        //try to authenticate the user:
        if(__ModelProxy::getInstance()
           ->logon($login, $password)) {
            //redirect the user to the private page:
            $private_page_uri = __UriFactory::getInstance()
                      ->createUri()->setRoute('default')
                      ->setController('protectedPage');
            __FrontController::getInstance()
                      ->forward($private_page_uri);                      
        }
        else {
            $this->getComponent('error_label')
                 ->setText('Wrong username or password');
        }
                      
    }

}
