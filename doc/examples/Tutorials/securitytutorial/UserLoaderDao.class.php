<?php

class CustomUserLoader implements __IUserLoader {
    
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
            //connect to the database:
            $dbh = new PDO('mysql:host=localhost;dbname=my_db_name', 
                           $db_user, $db_password);
                           
            //find the user by filtering by login:
            $statement = $dbh->prepare("SELECT * 
                                        FROM users 
                                        WHERE login = ?");
            $login = $user_identity->getUsername();
            $statement->execute(array($login));

            //if the query has result in a single row:
            if($statement->rowCount() == 1) {
                $statement->setFetchMode(PDO::FETCH_ASSOC);
                $user_info = $arrValues = $stmt->fetch();
                
                //create a user instance and set the credentials:
                $user = new __User();
                $credentials  = new __PasswordCredentials();
                $credentials->setPassword
                              ($user_info['password']);
                $user->setCredentials($credentials);
                
                //now load roles asssociated to him:
                $roles = $this->_loadRoles($dbh, $user_info['id']);
                
                //and finally assign them to the user:               
                $user->setRoles($roles);
            }
            //close the connection
            $dbh = null;
        }
        return $user;
    }
    
    /**
     * Get an array of roles corresponding to a given user
     * 
     * @return array
     */
    public function _loadRoles($dbh, $user_id) {
        $return_value = array();
        $statement = $dbh->prepare("SELECT * 
                                    FROM roles 
                                    WHERE user_id = ?");
        $statement->execute(array($user_id));
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $roles_info = $stmt->fetchAll();
        foreach ($roles_info as $role_info){
            $role = __RoleManager::getInstance()
                                 ->getRole($role_info['role']);
            $return_value[] = $role;
        }
        return $return_value;    
    }
    
}
