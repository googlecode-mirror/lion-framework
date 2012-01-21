<?php

class __ModelServiceArgument {

    protected $_name  = null;
    protected $_index = null;
    protected $_is_json = false;
    
    public function setName($name) {
        $this->_name = $name;
    }
    
    public function getName() {
        return $this->_name;
    }
    
    public function setIndex($index) {
        $this->_index = $index;
    }
    
    public function getIndex() {
        return $this->_index;
    }
    
    public function setJson($json) {
        $this->_is_json = (bool)$json;
    }
    
    public function isJson() {
        return $this->_is_json;
    }
    
}
