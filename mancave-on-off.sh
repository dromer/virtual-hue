#! /bin/sh

# huecontrol lets you set configure a Hue setup
# https://github.com/flok99/huecontrol

/root/huecontrol/huecontrol.py -d 13,12,11,10,9 -c set-state -p $2
