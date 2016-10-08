#!/bin/bash

HOSTNAME="johndoe.dtdns.net"
PASSWORD="azerty"

CURRENTIP=`wget http://myip.dtdns.com -4 -q -O -`
DNSIP=`dig +short $HOSTNAME`

if [ -n "$CURRENTIP" ] && [ -n "$DNSIP" ] ; then
	if [ "$CURRENTIP" != "$DNSIP" ] ; then
		echo "Change from $DNSIP to $CURRENTIP"
		RETURN=`wget "https://www.dtdns.com/api/autodns.cfm?id=${HOSTNAME}&pw=${PASSWORD}&ip=${CURRENTIP}" -4 -q -O -`
		echo "dtdns.com response : $RETURN"
	else
		echo "IP still $DNSIP"
	fi
else
	echo "Check Network"
fi