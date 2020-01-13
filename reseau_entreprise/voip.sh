#!/bin/bash

sudo docker cp sip.conf voip:/usr/src/asterisk/;
sudo docker cp extensions.conf voip:/usr/src/asterisk

sudo docker exec voip bash -c "ip route del default;
    ip route add default via 120.0.48.3;
    
    /etc/init.d/asterisk"
