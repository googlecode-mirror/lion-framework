<?php

/**
 * This is the default controller for command line requests.
 * It's executed in case no controllers have been specified on command line
 *
 */
class __CommandLineController extends __ActionController {
    
    protected function _readCommandLineRequest() {

    	$parser = new Console_CommandLine();
 	
    	$parser->description = "Lion Framework " . LION_VERSION_NUMBER . ' (built: ' . LION_VERSION_BUILD_DATE . ")\n" .
    						   "An open source PHP Framework for rapid development of PHP web applications";
    	$parser->version = LION_VERSION_NUMBER;
    	$parser->addOption(
    			'clearcache',
    			array(
    					'short_name'  => '-c',
    					'long_name'   => '--clearcache',
    					'description' => 'clear the cache',
    					'action'      => 'StoreTrue'
    			)
    	);
    	// Adding an option that will store a string
    	$parser->addOption(
    			'info',
    			array(
    					'short_name'  => '-i',
    					'long_name'   => '--info',
    					'description' => 'show the runtime directives',
    					'action'      => 'StoreTrue',
    			)
    	);    	
    	// Adding an option that will store a string
    	$parser->addOption(
    			'bootstrap',
    			array(
    					'short_name'  => '-b',
    					'long_name'   => '--bootstrap',
    					'description' => 'bootstrap a new application',
    					'action'      => 'StoreTrue',
    			)
    	);
    	// Adding an option that will store a string
    	$parser->addOption(
    			'controller',
    			array(
    					'long_name'   => '--controller',
    					'description' => 'executes the given controller',
    					'action'      => 'StoreString',
    			)
    	);
    	// Adding an option that will store a string
    	$parser->addOption(
    			'action',
    			array(
    					'long_name'   => '--action',
    					'description' => 'executes the given action',
    					'action'      => 'StoreString',
    			)
    	);
    	
    	return $parser;
    }
    
    public function defaultAction()	{

    	$options = array();
		$parser = $this->_readCommandLineRequest();
		try {
			$result = $parser->parse();
			$options = $result->options;
		} catch (Exception $exc) {
			$parser->displayError($exc->getMessage());
		}		
		

	    if($options['clearcache']) {
	        if(__ModelProxy::getInstance()->clearCache()) {
                echo "Cache cleared!\n";
	        }
	    }
        else if($options['info']) {
            $this->_printLionInfo();
        }
        else if($options['bootstrap']) {
			if(__ModelProxy::getInstance()->doBootstrap(APP_DIR)) {
				echo "Bootstrap completed!\n";
			}        	
        }
        else {
        	$parser->displayUsage();
        }
	    
	}
	
    private function _printLionInfo() {
        echo 'Lion framework ' . LION_VERSION_NUMBER . ' (built: ' . LION_VERSION_BUILD_DATE . ")\n";
        echo "\n";
        echo "Runtime Directives\n";
        echo "------------------\n";
        $lion_directives = __Lion::getInstance()->getRuntimeDirectives()->getDirectives();
        $runtime_directives_values = array();
        foreach($lion_directives as $key => $value) {
            if(is_bool($value)) {
                if($value) {
                    $value = 'true';
                }
                else {
                    $value = 'false';
                }
            }
            echo "$key: $value\n";
        }
        echo "\nApplication Settings\n";
        echo "--------------------\n";
        $configuration = __ApplicationContext::getInstance()->getConfiguration();
        $settings = $configuration->getSettings();
        $setting_values = array();
        foreach($settings as $key => $setting) {
            $value = $configuration->getPropertyContent($key);
            if(is_bool($value)) {
                if($value) {
                    $value = 'true';
                }
                else {
                    $value = 'false';
                }
            }
            
            echo "$key: $value\n";
        }
        
    }	
    
}