#!/bin/bash

Notify=$1
MinSpeed=50

cd speedtest-cli-extras/bin
Speed=$(cut -f8 TildenSpeeds.tsv | tail -1)
Speed=${Speed%.*} # floor(${Speed})

if [ ${Speed} -lt ${MinSpeed} ]; then
   if [ ! ${Notify} ]; then # first failure
      Text="Current internet speed of ${Speed} Mbps, rerunning test now."
      echo ${Text} | mutt -s "[Home] Slow Internet" karlaburkhardt@gmail.com
      cd /home/pi
      ./SpeedTracker.sh 1 # reruns test with notification flag
   else # already failed...
      Text="Second failed test, speed is ${Speed} Mbps now."
      echo $Text | mutt -s "[HA] Slow Internet" -c karlaburkhardt@gmail.com Comcast@comcast.net
   fi
fi

exit 0
