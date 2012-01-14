<?php

class FooBarEventHandler extends __EventHandler {

    /**
     * Set the 'FoO BaR!' string to the myLabel text
     * property when click the myButton component
     *
     */
    public function myButton_click() {
        //retrieve the component myLabel
        $my_label = $this->getComponent('myLabel');
        //assign the 'FoO BaR!' to the text property
        $my_label->setText('FoO BaR!');
    }

    
}