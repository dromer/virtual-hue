#! /bin/sh

# Example script that can be invoked by the virtual bridge.
# It retrieves the state of a lamp (or whatever you want to be switched) and returns that to the virtual bridge.
# This script can also be written in python or perl or whatever you like.

MQTT_SERVER=192.168.64.1

# example:
if [ "$1" = "some_id" ] ; then
	TOPIC='mancave_power_state'
elif [ "$1" = "another_lamp" ] ; then
	TOPIC='vanheusden/lamp/thisstatus'
else
	echo $1 is unknown
fi

STATE=`/usr/bin/mosquitto_sub -h $MQTT_SERVER -t $TOPIC -C 1`

if [ "$STATE" != "0" ]
then
	echo $1 'ON'
	exit 1
fi

echo $1 'OFF'

exit 0
