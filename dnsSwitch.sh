#!/bin/sh

sudo networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4

sudo dscacheutil -flushcache
sudo kill -HUP  mDNSResponder


# log stream --predicate 'process == "mDNSResponder"' --info
