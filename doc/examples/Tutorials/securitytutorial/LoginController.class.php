<?php

class LoginController extends __ActionController {

    public function defaultAction() {
        $return_value = new __ModelAndView('login');
        return $return_value;
    }

}