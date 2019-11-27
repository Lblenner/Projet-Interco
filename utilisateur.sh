#!/bin/bash

sudo docker exec box bash -c "
    ip addr flush dev eth0;
    ip addr flush dev eth1;

    ip addr add 192.168.0.2 dev eth1"
