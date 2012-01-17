#!/usr/local/bin/bash

IP=$1
NAME=$2
EMAIL=$3
OWNER=$4

BASEDIR=`dirname $0`

MAC=$($BASEDIR/resolve_mac_address.sh $IP)
# doesn't seem as reliable as dhcp hostname
#NETBIOS=$($BASEDIR/resolve_netbios_name.sh $IP)
DHCPHOSTNAME=$($BASEDIR/resolve_hostname.sh $IP)

$BASEDIR/register_user.sh $MAC "$NAME" "$EMAIL" $IP $OWNER "$DHCPHOSTNAME"
$BASEDIR/send_gmail.perl $MAC "$NAME" "$EMAIL" $IP $OWNER "$DHCPHOSTNAME"
