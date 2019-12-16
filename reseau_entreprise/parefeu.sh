#!/bin/bash

sudo docker exec parefeu bash -c "ip addr flush dev eth1;
    ip addr flush dev eth2;

    ip addr add 120.0.48.3/24 dev eth1;
    ip addr add 120.0.48.9/24 dev eth2;
    ip route add 120.0.48.10 via 120.0.48.9 dev eth2;"
