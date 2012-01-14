<?php

/**
 * Our custom user loader, just a DAO implementing the 
 * __UserLoader.
 *
 */
class UserDao implements __IUserLoader {
    
    /**
     * This method expects a __UsernameIdentity to retrieve
     * the username and call to the model to get the user.
     *
     */
    public function &loadUser(__IUserIdentity $user_identity) {
        $return_value = null;
        if( $user_identity instanceof __UsernameIdentity ) {
            $username = $user_identity->getUsername();
            $return_value = $this->loadUserByUsername($username);
        }
        return $return_value;
    }
    
    /**
     * This method just returns the user instance that
     * corresponds to the given username.
     * 
     */
    public function &loadUserByUsername($username) {
        //get the user from the database
        $user = UserPeer::retrieveByPK($username);
        return $user;
    }
    
}