#!/bin/bash

sudo docker exec box bash -c "ip addr flush dev eth1
    ip addr flush dev eth0;
    
    ip addr add 120.0.48.10/24 dev eth1"
