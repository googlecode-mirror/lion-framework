<?php

class HelloWorldEventHandler extends __EventHandler {

    /**
     * Shows a customized hello message into the helloLabel
     * by reading from input components:
     *
     */
    public function sayHelloButton_click() {
        //get the name from the input component:    
        $name = $this->getComponent('nameInputBox')->
                       getValue();

        //get the salutation from the combobox:                       
        $salutation = $this->getComponent('salutationComboBox')->
                       getValue();

        //compose the customized hello message:                       
        $hello_message = 'Hello ' . $salutation . ' ' . $name;                       

        //show the customized hello message within the label:
        $label_component = $this->getComponent('helloLabel')->
                                  setText($hello_message);

    }

}
