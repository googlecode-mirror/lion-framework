<?php

class __ClassLoaderException extends __LionException { }

class __ClassLoaderExceptionRetranslator extends __LionException
{
   public function __construct($serializedException)
   {
       throw unserialize($serializedException);
   }
}