#!/bin/bash

sudo docker cp daemons RE:/etc/quagga/;
sudo docker cp zebra.conf RE:/etc/quagga/;
sudo docker exec RE bash -c "ip addr flush dev eth0;
    ip addr flush dev eth1;
    ip addr add 120.0.51.2/24 dev eth1;
    touch /etc/quagga/ospfd.conf;
    echo 'hostname RE' >> /etc/quagga/ospfd.conf;
    echo 'router ospf' >> /etc/quagga/ospfd.conf;
    echo 'redistribute static' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.51.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    echo 'default-information originate' >> /etc/quagga/ospfd.conf;
    /etc/init.d/zebra restart;
    /etc/init.d/ospfd restart"