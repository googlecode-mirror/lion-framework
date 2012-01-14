<?php

class InvoiceDAO {

    /**
     * This variable represents our database connection.
     * 
     */
    private $_connection = null;

    ...
    
    /**
     * Setter for connection: It will set the connection instance
     * 
     */    
    public function setConnection(DbConnection $connection) {
        $this->_connection = $connection;
    }

    ...
    
}