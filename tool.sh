#!/bin/bash

directory=$1

echo "Android Forensic - Extractor"
folder=$(pwd)
echo "Enter IMEI Number"
read casefolder
echo "Files can be found in $folder"
set c=1
while [ $c >= 1 ]
do
echo "1) Retrieve whole system image"
echo "2) Exit"
echo "Enter your choice"

read -n 1 option
echo ""
case "$option" in				# This part onwards manages selection

	1) echo "Imaging device";

	echo "Here are the list of partitions on the device";
	adb shell 'cat /proc/partitions'

	adb shell "su -c \"/system/bin/busybox nc -l -p 5555 -e /system/bin/busybox dd if=/dev/block/mmcblk0p7\"" & $folder/imaging.sh 
	
	;;
	
2)
clear
exit
;;

	
esac
done
