<?php

class InvoiceDAO {

    /**
     * This variable represents our database connection.
     * 
     */
    private $_connection = null;

    /**
     * Constructor method: It will require a connection instance
     * 
     */    
    public function __construct(DbConnection $connection) {
        $this->_connection = $connection;
    }

    ...
    
}