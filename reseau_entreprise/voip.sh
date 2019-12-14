#!/bin/bash

sudo docker exec voip bash -c "ip addr flush dev eth1
    ip addr flush dev eth0;
    
    ip addr add 120.0.48.6/24 dev eth1"
