#!/bin/bash

sudo docker exec dns bash -c "ip addr flush dev eth1
    ip addr flush dev eth0;
    
    ip addr add 120.0.48.5/24 dev eth1;
    ip route add default via 120.0.48.5"
