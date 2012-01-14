<?php

class UserServices {

    public function logon($login, $password) {
    
        //set both the user identity and the
        //credentials with given login and password:
        $user_identity = new __UsernameIdentity();
        $user_identity->setUsername($login);
        $credentials = new __PasswordCredentials();
        $credentials->setPassword($password);
        
        //call the authentication manager in order to 
        //authenticate the user:
        $return_value = __AuthenticationManager::getInstance()
                        ->logon($user_identity, $credentials);
                        
        return $return_value;
    }
    
}

