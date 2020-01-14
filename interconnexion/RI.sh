#!/bin/bash

sudo docker cp bgpd.conf RI:/etc/quagga/;
sudo docker cp zebra.conf RI:/etc/quagga/;
sudo docker exec RI bash -c "
    touch /etc/quagga/daemons;
    echo 'zebra=yes' >> /etc/quagga/ospfd.conf;
    echo 'bgpd=yes' >> /etc/quagga/ospfd.conf;
    echo 'ospfd=yes' >> /etc/quagga/ospfd.conf;
    echo 'ospf6d=no' >> /etc/quagga/ospfd.conf;
    echo 'ripd=no' >> /etc/quagga/ospfd.conf;
    echo 'ripngd=no' >> /etc/quagga/ospfd.conf;
    
    touch /etc/quagga/ospfd.conf;
    echo 'hostname RI' >> /etc/quagga/ospfd.conf;
    echo 'router ospf' >> /etc/quagga/ospfd.conf;
    echo 'redistribute bgp' >> /etc/quagga/ospfd.conf;
   
    echo 'network 120.0.51.0/24 area 0.0.0.1' >> /etc/quagga/ospfd.conf;
    /etc/init.d/zebra restart;
    /etc/init.d/ospfd restart"
