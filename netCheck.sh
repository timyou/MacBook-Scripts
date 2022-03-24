#!/bin/bash
# Command Line -d debug Hardware

echo ""
echo ""
echo ""

if [ "x$1" = "x-d" ] 
then
  echo ""
  echo "--------------------------------"
  echo "- Check Hardware NIC interface -"
  echo "--------------------------------"
  echo ""

  networksetup -listallhardwareports

else

  echo  "-d  to check Hardware interface."

fi

echo ""
echo "--------------------------------"
echo "- Check Ethernet Port Active ? -"
echo "--------------------------------"
echo ""

/sbin/ifconfig en6 | grep active -B3

echo ""

if [ "x$1" = "x-d" ]
then
  echo ""
  echo -n "See interface active? See IP ? "
  while true; do
	read yesno
	case $yesno in
		[Yy]*) break;;
		[Nn]*) echo "interface IP issue."; exit;;
	esac
  done
fi

echo ""
echo "--------------------------------"
echo "- Check  LAN (192.168.11.1)  ? -"
echo "--------------------------------"
echo ""

ping -q -W 1 -c 1 192.168.11.1  > /dev/null && echo GOOD || echo error

echo ""
echo "--------------------------------"
echo "- Check  WAN (8.8.8.8)  ?      -"
echo "--------------------------------"
echo ""

ping -q -W 1 -c 1 8.8.8.8  > /dev/null && echo GOOD || echo error

echo ""
echo "--------------------------------"
echo "- Check DNS (www.google.com) ? -"
echo "--------------------------------"
echo ""

ping -q -W 1 -c 1 www.google.com  > /dev/null && echo GOOD || echo error

echo ""
