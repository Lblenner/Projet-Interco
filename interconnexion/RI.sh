#!/bin/bash

sudo docker cp daemons RI:/etc/quagga/;
sudo docker cp zebra.conf RI:/etc/quagga/;
sudo docker exec RI bash -c "ip addr flush dev eth0;
    ip addr flush dev eth1;
    ip addr add 120.0.51.1/24 dev eth1;
    touch /etc/quagga/ospfd.conf;
    echo 'hostname RI' >> /etc/quagga/ospfd.conf;
    echo 'router ospf' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.51.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    /etc/init.d/zebra restart;
    /etc/init.d/ospfd restart"
