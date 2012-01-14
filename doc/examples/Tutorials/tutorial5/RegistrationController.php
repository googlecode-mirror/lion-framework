<?php

class RegistrationController extends __ActionController {
    
    public function defaultAction() {
        return new __ModelAndView('registrationForm');
    }
    
}