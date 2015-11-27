#!/bin/sh
#/bin/sh
ZWAY_INIT=/etc/init.d/z-way-server
if [[ ! -f $ZWAY_INIT ]]; then
        echo "First container run (or data container missing), installing Z-Way.."
        echo
        /bin/bash /bin/install-zway
fi

/etc/init.d/z-way-server start
/bin/sh
