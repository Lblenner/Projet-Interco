#!/bin/bash

sudo docker exec box bash -c "
    echo 'nameserver 120.0.48.5' > /etc/resolv.conf;"

sudo docker cp dnsmasq.conf box:/etc//;

sudo docker exec box bash -c "
    /etc/init.d/dnsmasq restart;

    ip route del default;
    ip route add default via 120.0.52.3;
    
    echo 'nameserver 120.0.48.5' > /etc/resolv.conf;

    iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE;";
