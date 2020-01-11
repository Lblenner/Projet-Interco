#!/bin/bash

sudo docker network create -d bridge --subnet 120.0.53.0/24 bb
sudo docker network connect --ip 120.0.53.2 bb RE
sudo docker network connect --ip 120.0.53.3 bb parefeu

sudo docker exec parefeu bash -c "ip route del default 
    ip route add default via 120.0.53.2"
sudo docker exec RE bash -c "ip route add 120.0.48.0/24 via 120.0.53.3;
    ip route add 120.0.52.0/24 via 120.0.53.3;
    /etc/init.d/ospfd restart"