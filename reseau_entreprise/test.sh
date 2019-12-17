#!/bin/bash

sudo docker network create br
sudo docker network connect br RE
sudo docker network connect br parefeu
sudo docker exec parefeu bash -c "ip addr flush dev eth3;
    ip addr add 120.0.53.1/24 dev eth3;"
sudo docker exec RE bash -c "ip addr flush dev eth2;
    ip addr add 120.0.53.2/24 dev eth2;"