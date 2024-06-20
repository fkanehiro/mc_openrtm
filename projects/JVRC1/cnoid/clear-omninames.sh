#!/bin/bash

sudo systemctl stop omniorb-nameserver
sudo rm -f /var/log/omniorb-nameserver.log 2> /dev/null
sudo rm -f /var/lib/omniorb/* 2> /dev/null
sudo rm -f /tmp/rtcmanager.ref 2> /dev/null
sudo systemctl start omniorb-nameserver
for i in {0..9}
do
    [ -f /var/log/omniorb-nameserver.log ] && break
    sleep 1
done
tail /var/log/omniorb-nameserver.log
