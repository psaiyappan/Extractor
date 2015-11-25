#!/bin/bash
echo ""
sleep 10
counter=$((counter+1))
currentDir=$(pwd)1

adb forward tcp:5555 tcp:5555 # sets up connection from which we recieve the data stream
nc 127.0.0.1 5555 | pv -i 0.5 > image.dd

gdisk -l image.dd > partitioninfo
