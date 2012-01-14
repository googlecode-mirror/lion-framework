<?php

class CustomUserLoader implements __IUserLoader {
    
    //valid login and passwords:
    private $_user_and_passwords = array(
        'aparraga' => 'secret1',
        'ckop'     => 'secret2',
        'dparraga' => 'secret3',
        'goofy'    => 'secret4'
    );

    /**
     * Get the user identity and returns a user corresponding
     * to the given identity.
     * 
     * Note that the returned user contains his
     * credentials in order to be used by the security
     * framework
     * 
     */
    public function &loadUser(__IUserIdentity $user_identity) {
        $user = null;
        if($user_identity instanceof __UsernameIdentity) {
            //get the login string from the user identity:
            $login = $user_identity->getUsername();
            //check if the login correspond to any of our
            //valid logins:
            if(key_exists($login, $this->_user_and_passwords)) {
                //create a user instance and set the credentials:
                $user = new __User();
                $credentials  = new __PasswordCredentials();
                $credentials->setPassword
                              ($this->_user_and_passwords[$login]);
                $user->setCredentials($credentials);
            }
        }
        return $user;
    }
    
}


