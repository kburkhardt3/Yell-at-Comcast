#!/bin/bash

Notify=$1

cd speedtest-cli-extras/bin
sudo ./speedtest-csv >> TildenSpeeds.tsv

cd /home/pi
if [ ! ${Notify} ]; then
   sudo ./SpeedEmail.sh
else
   sudo ./SpeedEmail.sh ${Notify}
fi
