<?php

class __SiteAnalyzerEventHandler extends __EventHandler {

    public function updateUpdateStatus($crawled_pages, $pending_pages) {
        $crawled_pages = (int) $crawled_pages;
        $updateStatus = $this->getComponent('updateStatus');
        $crawled_links = $updateStatus->crawled_links;
        $updateStatus->crawled_links = $updateStatus->crawled_links + $crawled_pages;
        $total_pages = $updateStatus->crawled_links + $pending_pages;
        $updateStatus->setText(' Crawling the site, please wait ... (' . $updateStatus->crawled_links . ' of ' . $total_pages . ' pages crawled)');
        __ClientNotificator::getInstance()->notify();
    }
    
    /**
     * Updates the sitemap
     *
     * @param __UIEvent $event
     */
    public function updateSitemap_click(__UIEvent &$event) {
        $this->getComponent('updateStatus')->setText(" Crawling the site, please wait...");
        $this->getComponent('updateStatus')->crawled_links = 0;
        __ClientNotificator::getInstance()->notify();
        $sitemap = __SiteMap::getInstance();
        $sitemap->update(array($this, 'updateUpdateStatus'));
        $this->getComponent('updateStatus')->setText(" Calculate page rank, please wait...");
        __ClientNotificator::getInstance()->notify();
        
        $page_ranker = new __PageRanker($sitemap);
        $page_ranker->calculate();
        $sitemap->saveResults();
        $this->getComponent('updateStatus')->setText("");
        $last_update = __SiteMap::getInstance()->getLastUpdate();
        if($last_update !== null) {
            $this->getComponent('lastUpdate')->setText(date("Y/m/d H:i:s", $last_update));
        }
        $analyzerSection = $this->getComponent('analyzerSection');
        $analyzerSection->setController('siteAnalyzerResults');
        $analyzerSection->setAction('generalAnalysis');
        $analyzerSection->refresh();
    }
    
    public function showGeneralInfo_click(__UIEvent &$event) {
        $analyzerSection = $this->getComponent('analyzerSection');
        $analyzerSection->setController('siteAnalyzerResults');
        $analyzerSection->setAction('generalAnalysis');
        $analyzerSection->refresh();
    }

    public function showRoutesInfo_click(__UIEvent &$event) {
        $analyzerSection = $this->getComponent('analyzerSection');
        $analyzerSection->setController('siteAnalyzerResults');
        $analyzerSection->setAction('routesAnalysis');
        $analyzerSection->refresh();
    }
    
    public function showRankInfo_click(__UIEvent &$event) {
        $analyzerSection = $this->getComponent('analyzerSection');
        $analyzerSection->setController('siteAnalyzerResults');
        $analyzerSection->setAction('rankAnalysis');
        $analyzerSection->refresh();
    }
    
    
}
