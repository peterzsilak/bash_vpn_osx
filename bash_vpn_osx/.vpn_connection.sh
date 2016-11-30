#!/bin/sh
VPN_NAME=''
SECRET_KEY=''

RESULT=$(ifconfig | grep -c ppp0)
if [[ "$RESULT" == "0" ]]; then
	echo "VPN connection starting"
	scutil --nc start $VPN_NAME --secret $SECRET_KEY
	sleep 2
	echo "VPN connection started"
else
    echo "VPN connection stopping"
	scutil --nc stop $VPN_NAME --secret $SECRET_KEY
	sleep 2
	echo "VPN connection stopped"
fi