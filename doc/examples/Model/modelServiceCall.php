<?php

    //retrieve all the invoices:
    $invoices = __ModelProxy::getInstance()->getAllInvoices();
    
    //retrieve a concrete invoice:
    $invoice  = __ModelProxy::getInstance()->getInvoice($invoice_id);
    
    //save an invoice:
    __ModelProxy::getInstance()->saveInvoice($invoice);