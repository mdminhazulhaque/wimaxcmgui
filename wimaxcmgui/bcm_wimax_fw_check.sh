#!/bin/bash

echo "Root access is required"
sudo -v
 
echo "Unloading kernel module..."
modprobe -rv bcm_wimax
sleep 2
 
echo "Restarting udev service..."
service udev restart
sleep 2

echo "Checking firmware and config..."

if [ -f /lib/firmware/macxvi200.bin ]
then
    echo "macxvi200.bin exists"
else
    echo "macxvi200.bin missing"
    exit 1
fi

if [ -f /lib/firmware/macxvi.cfg ]
then
    echo "macxvi.cfg exists"
else
    echo "macxvi.cfg missing"
    exit 1
fi

echo "Reading firmware and config from disk"
cat /lib/firmware/macxvi200.bin > /dev/null
cat /lib/firmware/macxvi.cfg > /dev/null

echo "Loading kernel module ..."
sleep 2
modprobe -v bcm_wimax
echo "Plug in the modem now"

exit 0