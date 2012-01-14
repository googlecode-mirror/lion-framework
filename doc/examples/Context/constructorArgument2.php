<?php

class InvoiceDAO {

    /**
     * This variable represents our database connection.
     * 
     */
    private $_connection = null;
    
    private $_persistence_engine = null;

    /**
     * Constructor method: It will require a connection instance
     * 
     */    
    public function __construct(DbConnection $connection, 
                                $persistence_engine) {
        $this->_connection = $connection;
        $this->_persistence_engine = $persistence_engine;
    }

    ...
    
}