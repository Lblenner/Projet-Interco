#!/bin/bash

sudo docker cp daemons RSU:/etc/quagga/;
sudo docker cp zebra.conf RSU:/etc/quagga/;
sudo docker exec RSU bash -c "ip addr flush dev eth0;
    ip addr flush dev eth1;
    ip addr add 120.0.50.1/24 dev eth1;
    ip addr flush dev eth2;
    ip addr add 120.0.49.2/24 dev eth2;
    touch /etc/quagga/ospfd.conf;
    echo 'hostname RSU' >> /etc/quagga/ospfd.conf;
    echo 'router ospf' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.50.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.49.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    /etc/init.d/zebra restart;
    /etc/init.d/ospfd restart"