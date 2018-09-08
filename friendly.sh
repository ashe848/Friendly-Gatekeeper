#!/bin/sh

./sandbox.sh ${1} &

sleep 5

pid=$(pgrep ${1%.*} | tail -n 1)

echo Files opened are:
lsof -p $pid | grep REG | grep -v /Applications/"${1}" | awk '{print $9}' | tail -n+2 | sort | uniq -c

echo Internet connections opened are:
lsof -p $pid | grep IPv | cut -d ">" -f2 | sort | uniq -c