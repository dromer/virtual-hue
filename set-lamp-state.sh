#! /bin/sh

# example script that can be invoked by the virtual bridge
# can also be python or whatever you like

echo ID of the lamp: $1
echo state: $2

MQTT_SERVER=192.168.64.1

# example:
if [ "$1" = "some_id" ] ; then
	if [ "$2" = "on" ] ; then
		echo ON
		/usr/bin/mosquitto_pub -h $MQTT_SERVER -t mancave_power_state -m '3' -r
	else
		echo OFF
		/usr/bin/mosquitto_pub -h $MQTT_SERVER -t mancave_power_state -m '0' -r
	fi
elif [ "$1" = "another_lamp" ] ; then
	if [ "$2" = "on" ] ; then
		echo ON
		/usr/bin/mosquitto_pub -h $MQTT_SERVER -t vanheusden/lamp/thisstatus -m '1' -r
	else
		echo OFF
		/usr/bin/mosquitto_pub -h $MQTT_SERVER -t vanheusden/lamp/thisstatus -m '0' -r
	fi
fi

exit 0
