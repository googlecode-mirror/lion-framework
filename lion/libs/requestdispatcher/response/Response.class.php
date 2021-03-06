<?php

abstract class __Response extends __ContentContainer implements __IResponse {
		
    protected $_view_codes = array();
    protected $_cacheable = true;
    protected $_processed_content = null;
    
    const NOT_CACHEABLE = false;
    const CACHEABLE = true;
    
    public function prepareToSleep() {
        if($this->_processed_content === null) {
            $this->_processed_content = $this->_doGetContent();
        }
    }
    
    public function getContent() {
        if($this->_processed_content !== null) {
            $return_value = $this->_processed_content;
            $this->_processed_content = null;
        }
        else {
            $return_value = $this->_doGetContent();
        }
        return $return_value;
    }
    
    protected function _doGetContent() {
        if(__FrontController::getInstance()->getRequestType() == REQUEST_TYPE_XMLHTTP ||
           $this == __FrontController::getInstance()->getResponse()) {
            __ResponseWriterManager::getInstance()->write($this);
            __ResponseWriterManager::getInstance()->clear();
        }
        $return_value = parent::_doGetContent();
        return $return_value;
    }
    
    public function addViewCode($view_code, $cacheable = self::NOT_CACHEABLE) {
        $this->_view_codes[$view_code] = $cacheable;
        if($cacheable === false) {
            $this->setCacheable(false);
        }
    }
    
    public function getViewCodes() {
        return array_keys($this->_view_codes);
    }
    
    public function getCacheableViews() {
        $return_value = array();
        foreach($this->_view_codes as $view_code => $cacheable) {
            if($cacheable) {
                $return_value[] = $view_code;
            }
        }
        return $return_value;
    }
    
    public function setCacheable($cacheable) {
        $this->_cacheable = (bool) $cacheable;
    }
    
    public function isCacheable() {
        //anonymous users in non-debug mode are candidates to cache the response
        if(__AuthenticationManager::getInstance()->isAnonymous() &&
          !__Lion::getInstance()->getRuntimeDirectives()->getDirective('DEBUG_MODE')) {
            $return_value = $this->_cacheable;
        }
        else {
            $return_value = false;
        }
        return $return_value;
    }

}