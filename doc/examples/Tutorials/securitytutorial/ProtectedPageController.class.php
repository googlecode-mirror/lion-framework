<?php

class ProtectedPageController extends __ActionController {

    public function defaultAction() {
        $mav = new __ModelAndView('protectedPage');
        return $mav;
    }

}