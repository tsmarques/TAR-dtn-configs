#!/bin/bash

if [ "$#" -eq 0 ]
then
    echo "no interface..."
    exit
fi

dtnd -i "$1" -v -c "../ibrdtn-repo/ibrdtn/daemon/etc/ibrdtnd.conf"
