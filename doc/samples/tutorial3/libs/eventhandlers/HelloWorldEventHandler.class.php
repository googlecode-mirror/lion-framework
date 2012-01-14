<?php

class HelloWorldEventHandler extends __EventHandler {

    /**
     * If the onClick event is raised by the helloWorldButton,
     * show the 'Hello World!' string within the
     * helloWorldLabel
     *
     */
    public function helloWorldButton_click() {
        $label_component = $this->getComponent('helloWorldLabel');
        $label_component->setText('Hello World!');
    }

}