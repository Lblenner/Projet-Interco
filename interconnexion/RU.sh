#!/bin/bash

sudo docker cp daemons RU:/etc/quagga/;
sudo docker cp zebra.conf RU:/etc/quagga/;
sudo docker exec RU bash -c "
    iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE;
    iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE;

    touch /etc/quagga/ospfd.conf;
    echo 'hostname RU' >> /etc/quagga/ospfd.conf;
    echo 'router ospf' >> /etc/quagga/ospfd.conf;
    echo 'redistribute static' >> /etc/quagga/ospfd.conf;
    echo 'redistribute connected' >> /etc/quagga/ospfd.conf;
    echo 'redistribute kernel' >> /etc/quagga/ospfd.conf;
    echo 'default-information originate' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.50.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    echo 'network 120.0.51.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    /etc/init.d/zebra restart;
    /etc/init.d/ospfd restart"