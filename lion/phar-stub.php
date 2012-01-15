<?php
Phar::mapPhar();
define('LION_DIR', 'phar://lion.phar/lion/');
define('SANDBOX_DIR', 'phar://lion.phar/app/');
include 'phar://lion.phar/lion/lion.php';
__HALT_COMPILER();