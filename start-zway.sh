#!/usr/bin/env bash

ZWAY_INIT=/etc/init.d/z-way-server

if [[ ! -f $ZWAY_INIT ]]
  then
    /etc/init.d/z-way-server start
    /bin/sh
  else
    echo "First container run (or data container missing), installing Z-Way.."
    /bin/bash /bin/install-zway
fi
