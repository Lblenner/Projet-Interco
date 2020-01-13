#!/bin/bash

sudo docker exec user bash -c "
    echo 'nameserver 120.0.48.5' > /etc/resolv.conf;
    ip route del default;
    ip route add default via 192.168.1.2; 
    ip addr flush dev eth1;
    dhclient eth1;"