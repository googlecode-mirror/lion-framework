<?php

class LoginController extends __ActionController {

    public function defaultAction() {
        return new __ModelAndView('login');
    }

}
