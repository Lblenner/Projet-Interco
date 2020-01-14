#!/bin/bash

#Redirection vers et depuis l'interface indiqué
sudo iptables -t nat -A POSTROUTING --out-interface $1 -j MASQUERADE  
sudo iptables -A FORWARD --in-interface br-$(docker network ls --filter name=ebr3 --quiet) -j ACCEPT

sudo iptables -t nat -A POSTROUTING --out-interface br-$(docker network ls --filter name=ebr3 --quiet) -j MASQUERADE  
sudo iptables -A FORWARD --in-interface $1 -j ACCEPT