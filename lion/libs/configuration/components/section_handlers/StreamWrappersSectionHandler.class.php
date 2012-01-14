<?php

/**
 * This is the section handler in charge of processing &lt;stream-wrappers&gt; configuration sections
 *
 */
class __StreamWrappersSectionHandler extends __CacheSectionHandler {
    
    public function &doProcess(__ConfigurationSection &$section) {
        $return_value = array();
        $stream_wrappers = $section->getSections();
        foreach($stream_wrappers as &$stream_wrapper) {
            $stream_wrapper_class = $stream_wrapper->getAttribute('stream-wrapper-class');
            $return_value[$stream_wrapper->getAttribute('protocol')] = $stream_wrapper_class;
        }
        return $return_value;
    }
    
}