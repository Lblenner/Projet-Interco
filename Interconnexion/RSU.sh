#!/bin/bash

sudo docker exec RSU bash -c "ip addr flush dev eth0;
    ip addr flush dev eth1;
    ip addr flush dev eth2;"
