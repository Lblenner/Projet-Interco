#!/bin/bash

sudo docker exec box bash -c "
    ip addr flush dev eth0;
    ip addr flush dev eth1;
    ip addr flusg dev eth2;

    ip addr add 192.168.0.1 dev eth2;
    ip addr add 120.0.48.9/24 dev eth1"
