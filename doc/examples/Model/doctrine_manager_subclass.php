<?php

class LionDoctrine_Manager extends Doctrine_Manager {

    public function bindComponents(array $components) {
        foreach($components as $component_class => $component_connection_id) {
            $this->bindComponent($component_class, $component_connection_id);
        }
    }

}