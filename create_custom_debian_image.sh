#!/bin/bash

sudo docker run -dit --name install --privileged debian;
sudo docker exec install bash -c "
    apt-get update &&
    apt-get install -y curl &&
    apt-get install -y tshark && 
    apt-get install -y iptables &&
    apt-get install -y vim &&
    rm -rf /var/lib/apt/lists/*"
sudo docker commit install debian_cust
sudo docker stop install
sudo docker rm install

sudo docker run -dit --name install --privileged debian_custom;
sudo docker exec install bash -c "
    apt-get update;
    apt-get install -y nginx;"
sudo docker commit install debian_webb
sudo docker stop install
sudo docker rm install

sudo docker run -dit --name install --privileged debian_custom;
sudo docker exec install bash -c "
    apt-get update;
    apt-get install -y quagga;
    apt-get install -y lsb-base;"
sudo docker commit install debian_ospf
sudo docker stop install
sudo docker rm install

sudo docker run -dit --name install --privileged debian_custom;
sudo docker exec install bash -c "
    apt-get update;
    apt-get install -y bind9 dnsutils;"
sudo docker commit install debian_dnss
sudo docker stop install
sudo docker rm install

sudo docker run -dit --name install --privileged debian_custom;
sudo docker exec install bash -c "
    apt-get update;
    apt-get install -y dnsmasq;"
sudo docker commit install debian_dhcp
sudo docker stop install
sudo docker rm install

sudo docker run -dit --name install --privileged debian_custom;
sudo docker exec install bash -c "
    apt update;
    apt install -y isc-dhcp-client;"
sudo docker commit install debian_user
sudo docker stop install
sudo docker rm install