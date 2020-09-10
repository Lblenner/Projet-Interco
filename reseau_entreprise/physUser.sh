#!/bin/bash

sudo ip addr flush dev br-$(sudo docker network ls --filter name=ebr3 --quiet);
sudo dhclient br-$(sudo docker network ls --filter name=ebr3 --quiet)

#sudo iptables -t nat -A POSTROUTING --out-interface $1 -j MASQUERADE 
#sudo iptables -A FORWARD --in-interface br-$(sudo docker network ls --filter name=ebr3 --quiet) -j ACCEPT

#sudo iptables -t nat -A POSTROUTING --out-interface br-$(sudo docker network ls --filter name=ebr3 --quiet) -j MASQUERADE  
#sudo iptables -A FORWARD --in-interface $1 -j ACCEPT

#sudo iptables -A FORWARD -i br-$(docker network ls --filter name=ebr3 --quiet) -o $1 -j ACCEPT
#sudo iptables -A FORWARD -i $1 -o br-$(docker network ls --filter name=ebr3 --quiet) -m state --state ESTABLISHED,RELATED \
         #-j ACCEPT
