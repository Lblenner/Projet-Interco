#!/bin/bash

sudo docker network create -d bridge --subnet 120.0.53.0/24 bbb
sudo docker network connect --ip 120.0.53.3 bbb parefeu

sudo docker exec parefeu bash -c "ip route del default; 
    ip route add default via 120.0.53.1"


#Redirection vers et depuis l'interface indiqué
sudo iptables -t nat -A POSTROUTING --out-interface $1 -j MASQUERADE; 
sudo iptables -A FORWARD --in-interface br-$(docker network ls --filter name=bbb --quiet) -j ACCEPT;

sudo iptables -t nat -A POSTROUTING --out-interface br-$(docker network ls --filter name=bbb --quiet) -j MASQUERADE;
sudo iptables -A FORWARD --in-interface $1 -j ACCEPT;


#sudo iptables -A FORWARD -i wlan1 -o wlan0 -j ACCEPT
#sudo iptables -A FORWARD -i wlan0 -o wlan1 -m state --state ESTABLISHED,RELATED \
         -j ACCEPT

