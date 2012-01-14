export PHP_COMMAND=/usr/bin/php
export PHING_HOME=./build-libs/phing-2.3.3
export PHP_CLASSPATH=${PHP_CLASSPATH}:${PHING_HOME}/classes
export PATH=${PATH}:${PHING_HOME}/bin

phing -logger phing.listener.DefaultLogger
