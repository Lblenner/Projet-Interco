#!/bin/bash

sudo docker exec web bash -c "apt-get update;
    apt-get install -y nginx;
    ip addr flush dev eth1;
    ip addr flush dev eth0;

    service nginx start;
    ip addr add 120.0.48.4/24 dev eth1"
