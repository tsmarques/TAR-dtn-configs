#!/bin/bash

echo "init: cleaning cache"
rm /var/spool/ibrdtn/bundles/*

echo "init: configuring interfaces"
ifconfig enp0s10 down
ifconfig enp0s10 10.0.1.4
