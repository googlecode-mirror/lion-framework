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
        //else if the anonymous identity is detected:
        else if ( $user_identity instanceof __AnonymousIdentity ) {
            $return_value = $this->loadAnonymousUser();
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
    
    /**
     * This method creates an anonymous user, it is,
     * an user with anonymous credentials.
     *
     */
    public function &loadAnonymousUser() {
        $user = new User();
        $credentials = new __AnonymousCredentials();
        $user->setCredentials($credentials);
        return $user;
    }
    
}