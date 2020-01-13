#!/bin/bash

sudo docker exec user bash -c "
    echo 'nameserver 120.0.48.5' > /etc/resolv.conf;
    ip addr flush dev eth1;
    dhclient eth1;"