#!/bin/bash

sudo docker exec web bash -c "apt-get update;
    apt-get install -y nginx;
    service nginx start;
    
    # Firewall
        iptables -t filter -P INPUT DROP;
        iptables -t filter -P FORWARD DROP;
        iptables -t filter -P OUTPUT DROP;
        # Autoriser loopback
        iptables -t filter -A INPUT -i lo -j ACCEPT;
        iptables -t filter -A OUTPUT -o lo -j ACCEPT;
        # Autoriser icmp
        iptables -t filter -A INPUT -p icmp -j ACCEPT;
        iptables -t filter -A OUTPUT -p icmp -j ACCEPT;
        # Autoriser connexion établies
        iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT;
        iptables -A OUTPUT -m state --state ESTABLISHED -j ACCEPT;
        # Autoriser tcp sur le port 80
        iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT;
        iptables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT;

    ip route add default via 120.0.48.4"
