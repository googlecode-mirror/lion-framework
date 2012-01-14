<?php

class __SiteAnalyzerResultsController extends __ProtectedController {

    public function generalAnalysisAction() {
        $mav = new __ModelAndView('generalAnalysis');
        $sitemap = __SiteMap::getInstance();
        $pages = $sitemap->getPages();
        $mav->number_of_pages = count($pages);
        $mav->site_rank = $sitemap->getSiteRank();
        $external_links = $sitemap->getExternalLinks();
        $mav->number_of_external_links = count($external_links);
        return $mav;
    }
    
    public function routesAnalysisAction() {
        $mav = new __ModelAndView('routesAnalysis');
        $sitemap = __SiteMap::getInstance();
        $routes = $sitemap->getRoutes();
        $mav->routes = $routes;
        $mav->external_links = $sitemap->getExternalLinks();
        return $mav;
    }
    
    public function rankAnalysisAction() {
        $mav = new __ModelAndView('rankAnalysis');
        $sitemap = __SiteMap::getInstance();
        $pages = $sitemap->getPages();
        usort ( $pages , array($this, 'sortByPagerank') );
        $mav->pages = $pages;
        return $mav;
    }
    
    public function sortByPagerank($page1, $page2) {
        $rank1 = $page1->getRank();
        $rank2 = $page2->getRank();
        if($rank1 == $rank2) {
            return 0;
        }   
        else if($rank1 > $rank2) {
            return -1;
        }
        else {
            return 1;
        }
    }
    
    
}
