<?php

class __InputBoxHtmlWriter extends __ComponentWriter {
    
    /**
     * bind a given component's property (value) with an HTML 
     * element property.
     * 
     */
    public function bindComponentToClient(__IComponent &$component) {
        __UIBindingManager::getInstance()->bind(
            //server end-point:
            new __ComponentProperty($component, 'value'), 
            //client end-point:
            new __HtmlElementProperty($component->getId(), 'value'));
	}
    
	...