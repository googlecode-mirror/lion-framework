<?php

/**
 * Our user class, just extending the __User.
 *
 */
class User extends __User {

    public function setPassword($password) {
        $credentials = new __PasswordCredentials();
        $credentials->setPassword($password);
        $this->setCredentials($credentials);
    }

}