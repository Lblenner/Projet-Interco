#!/bin/bash


sudo docker cp db.boulgour.fr dns:/etc/bind/;
sudo docker cp named.conf.local dns:/etc/bind/;

sudo docker exec dns bash -c "/etc/init.d/bind9 start;

    ip route del default;
    ip route add default via 120.0.48.3;
    
    echo 'nameserver 127.0.0.1' > /etc/resolv.conf;"
