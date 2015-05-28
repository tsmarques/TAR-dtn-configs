#!/bin/bash

function connect() {
    if [ "$1" = "earth" ]
    then
	ifconfig enp1s6 down
	ifconfig enp1s7 up
	ifconfig enp1s7 10.0.1.3
    else
	ifconfig enp1s7 down
	ifconfig enp1s6 up
	ifconfig enp1s6 11.0.1.1
    fi
}

if [ "$#" -eq 0 ]
then 
    echo "Too few arguments..."
    exit
fi

ORBIT_PERIOD="$1"
CURR_TIME=0
CURR_ON="earth"

echo "[Connected to Earth]"
while true
do
    CURR_TIME=`expr $CURR_TIME + 1`
    echo -n "$CURR_TIME "
    # time to change current state
    if [ "$CURR_TIME" -eq "$ORBIT_PERIOD" ]
    then
	echo ""  # newline
	echo ""
	# invert state
	if [ "$CURR_ON" = "earth" ]
	then
	    connect "rover"
	    CURR_ON="rover"
    	    echo "[Lost connection to Earth]"
    	    echo -n "[Connected to Rover]"
	else
	    connect "earth"
	    CURR_ON="earth"
    	    echo "[Lost connection to Rover]"
	    echo -n "[Connected to Earth]"
	fi

	echo ""
	CURR_TIME=0
    fi
    sleep 1
done
