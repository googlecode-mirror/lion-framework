<?php

class __XmlHttpResponse extends __HttpResponse {

    protected $_headers = array();
    protected $_boundary = null;
    protected $_use_x_mixed_replace_content = false;
    protected $_initialized = false;
    
    public function __construct() {
    }

    protected function _initializeXmlHttpResponse() {
        //use multipart long-pulling reverse ajax for other than IE
        $user_agent = strtoupper($_SERVER['HTTP_USER_AGENT']);
        if(strstr($user_agent, "FIREFOX") === false) {
            $this->_headers = array('Content-type: application/json');
        }
        else {
            $this->_use_x_mixed_replace_content = true;
            $this->_boundary = rand(1000, 9999);
            $this->_headers = array('Content-type: multipart/x-mixed-replace;boundary="rn' . $this->_boundary . '"');
            $this->appendContent("--rn" . $this->_boundary . "\n");
        }
        $this->_initialized = true;
    }
    
    public function flush() {
        if($this->_initialized == false) {
            $this->_initializeXmlHttpResponse();
        }
        //use multipart long-pulling reverse ajax for other than IE
        if($this->_use_x_mixed_replace_content == true) {
            $this->prependContent("Content-type: text/plain\n\n");
            $this->appendContent("\n--rn" . $this->_boundary . "\n");
        }
        parent::flush();
    }   
    
}