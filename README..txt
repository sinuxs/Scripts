USAGE : prompt$ pps-in.sh interfacename [enp0s8 etc ...]
                          or
        prompt$ pps-out interface name [enp0s8 etc ...]


incoming packets :the log file will be generated in /opt/trace-in-interface.log

outgoing packets : the log file will be generated in /opt/trace-out-interface.log


to run the bash in OS boot must ass the command to /etc/rc.d/rc.local and assign the permission to execute it.

for instance:
prompt$ sh pps-in.sh enp0s8 &            OR    prompt$ sh pps-out.sh enp0s8 &