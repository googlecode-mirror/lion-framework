<?php

class __SiteAnalyzerController extends __LionController {
    
    public function defaultAction()
    {
        $mav = new __ModelAndView('siteAnalyzer'); 
        $sitemap = __SiteMap::getInstance();
        $last_update = $sitemap->getLastUpdate();
        if($last_update !== null) {
            $mav->last_update = date("Y/m/d H:i:s", $last_update);
        }
        return $mav;
    }
    
}
