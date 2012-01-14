<?php

class __RankAnalysisEventHandler extends __EventHandler {

    public function updateRanks_click(__UIEvent &$event) {
        $sitemap = __SiteMap::getInstance();
        $page_ranker = new __PageRanker($sitemap);
        $page_ranker->calculate();
        $sitemap->saveResults();
        $this->refresh();
    }
    
}
