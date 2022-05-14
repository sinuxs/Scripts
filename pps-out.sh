#!/usr/bin/env bash
#This code is implemented to calculate the outgoing packets for each 10 seconds log
#Code is implemented by 30nasameti@Imen Pardis Technologies
#read -p "Interface Name:" interface
#echo "your choice is:$interface"
old_packets=0

#while true; do
for i in $(seq 1 8640);
do
    NOW=$(date +%d.%m.%y' '%R:%S)
    packets=$(awk '$1 == "'$1':"{print $11}' /proc/net/dev)
    if ((old_packets)); then
        clear
        # the variable rate contains the packets/seconds
        rate=$(bc <<< "($packets - $old_packets) / 10")

        if ((rate<=100)); then
            #ip link set eth0 down
               #printf "%s\n$rate%s\n" "$NOW" " packets/seconds">> /root/one.log

               #echo $NOW >> /root/one.log
               echo -e "$NOW", "$rate packets/seconds", "$1" >> /opt/trace-out-$1.log
        fi
    fi
    old_packets=$packets
    sleep 10
    #awk 'NR%2{printf "%s ",$0;next;}1' /root/one.log >> trace.log
done
