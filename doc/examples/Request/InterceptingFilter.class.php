<?php

class CurrencyFilter extends __Filter {
    
    /**
     * Change the currency in session by a given one if the 
     * currency parameter is present within the request.
     *
     */
    public function preFilter(__IRequest &$request, __IResponse &$response) {
        if($request->hasParameter('currency')) {
            $currency_iso_code = $request->getParameter('currency');
            //set the currency iso code within the CurrencyManager
            //singleton instance:
            CurrencyManager::getInstance()->
                             setCurrencyIsoCode($currency_iso_code);
        }
    }
    
}