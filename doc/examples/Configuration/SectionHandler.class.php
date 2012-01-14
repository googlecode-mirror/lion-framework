<?php

/**
 * foobars Section handler
 *
 */
class FooBarsSectionHandler implements __ISectionHandler {
    
    /**
     * Returns a collection of Foo instances according to
     * the configuration section.
     */ 
    public function &process(__ConfigurationSection &$section) {
        $return_value = array();
        $foobars = $section->getSections();
        foreach($foobars as &$foobar) {
            $foo = new Foo();
            $foo->setBar($foobar->getAttribute('bar'));   
            $return_value[] = $foo;
        }
        return $return_value;
    }
    
}