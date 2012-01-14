<?php

class LoginEventHandler extends __EventHandler {

    public function login_form_submit(__UIEvent &$event) {
    
        $login = $this->getComponent('login')
                             ->getValue();
        $password = $this->getComponent('password')
                             ->getValue();
        //authenticate the user:
        $user = __ModelProxy::getInstance()
                             ->logon($login, $password);

        //if authentication success
        if($user != null) {
            //redirect the user to the private page:
            __FrontController::getInstance()
                             ->redirect('protectedPage.action');
        }
                      
    }

}