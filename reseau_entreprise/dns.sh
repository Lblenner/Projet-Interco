#!/bin/bash

sudo docker exec dns bash -c "apt-get update;
    apt-get install -y bind9 dnsutils bind9-doc;


    ip route del default
    ip route add default via 120.0.48.3"
