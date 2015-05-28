#!/bin/bash

echo "init: cleaning cache"
rm /var/spool/ibrdtn/bundles/*

echo "init: configuring interfaces"
ifconfig enp1s7 down
ifconfig enp1s6 down

ifconfig enp1s7 10.0.1.3
ifconfig enp1s6 11.0.1.2
