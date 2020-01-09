#!/bin/bash

sudo docker cp daemons RSE:/etc/quagga/;
sudo docker cp zebra.conf RSE:/etc/quagga/;
sudo docker exec RSE bash -c "
    touch /etc/quagga/ospfd.conf;
    echo 'hostname RSE' >> /etc/quagga/ospfd.conf;
    echo 'router ospf' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.51.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.49.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    /etc/init.d/zebra restart;
    /etc/init.d/ospfd restart"