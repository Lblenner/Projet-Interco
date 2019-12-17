#!/bin/bash

sudo docker cp daemons RU:/etc/quagga/;
sudo docker cp zebra.conf RU:/etc/quagga/;
sudo docker exec RU bash -c "ip addr flush dev eth0;
    ip addr flush dev eth1;
    ip addr add 120.0.51.4/24 dev eth1;
    ip addr flush dev eth2;
    ip addr add 120.0.50.2/24 dev eth2;
    touch /etc/quagga/ospfd.conf;
    echo 'hostname RU' >> /etc/quagga/ospfd.conf;
    echo 'router ospf' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.50.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.51.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    /etc/init.d/zebra restart;
    /etc/init.d/ospfd restart"