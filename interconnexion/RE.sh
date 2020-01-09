#!/bin/bash

sudo docker cp daemons RE:/etc/quagga/;
sudo docker cp zebra.conf RE:/etc/quagga/;
sudo docker exec RE bash -c "
    touch /etc/quagga/ospfd.conf;
    echo 'hostname RE' >> /etc/quagga/ospfd.conf;
    echo 'router ospf' >> /etc/quagga/ospfd.conf;
    echo 'redistribute static' >> /etc/quagga/ospfd.conf;
    echo 'redistribute connected' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.51.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    echo 'default-information originate' >> /etc/quagga/ospfd.conf;
    /etc/init.d/zebra restart;
    /etc/init.d/ospfd restart"