#! /bin/sh

# example script that can be invoked by the virtual bridge
# can also be python or whatever you like

echo ID of the lamp: $1
echo state: $2

# example:
if [ "$1" = "some_id" ] ; then
	if [ "$2" = "on" ] ; then
		echo ON
		/usr/bin/mosquitto_pub -h 192.168.64.1 -t mancave_power_state -m '3'
	else
		echo OFF
		/usr/bin/mosquitto_pub -h 192.168.64.1 -t mancave_power_state -m '0'
	fi
fi

exit 0
