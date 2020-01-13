#!/bin/bash

sudo docker exec parefeu bash -c "
    echo 'nameserver 120.0.48.5' > /etc/resolv.conf;
    
    # Firewall
    # Sécurité
    # Bloquer par défaut tous les transfers
    iptables -P FORWARD DROP
    # Ping autorisé sur le web et dns depuis l'extérieur
    # Ping autorisé partout depuis l'intérieur
    iptables -A FORWARD -i eth2 -p icmp -j ACCEPT
    iptables -A FORWARD -i eth3 -o eth2 -p icmp -j ACCEPT
    iptables -A FORWARD -i eth3 -o eth1 -d 120.0.48.4 -p icmp -j ACCEPT
    iptables -A FORWARD -i eth3 -o eth1 -d 120.0.48.5 -p icmp -j ACCEPT
    # HTTP autorisé sur le serveur web depuis extérieur et intérieur
    iptables -A FORWARD -i eth3 -o eth1 -d 120.0.48.4 -p tcp --dport 80 -j ACCEPT
    iptables -A FORWARD -i eth2 -o eth1 -d 120.0.48.4 -p tcp --dport 80 -j ACCEPT
    # DNS autorisé sur le serveur DNS depuis extérieur et intérieur
    iptables -A FORWARD -i eth3 -o eth1 -d 120.0.48.5 -p udp --dport 53 -j ACCEPT
    iptables -A FORWARD -i eth3 -o eth1 -d 120.0.48.5 -p tcp --dport 53 -j ACCEPT
    iptables -A FORWARD -i eth2 -o eth1 -d 120.0.48.5 -p udp --dport 53 -j ACCEPT
    iptables -A FORWARD -i eth2 -o eth1 -d 120.0.48.5 -p tcp --dport 53 -j ACCEPT
    # FTP et SFTP autorisé sur le réseau intérieur
    iptables -A FORWARD -i eth2 -o eth1 -d 120.0.48.7 -p tcp --dport 22 -j ACCEPT
    iptables -A FORWARD -i eth2 -o eth1 -d 120.0.48.7 -p tcp --dport 21 -j ACCEPT
    iptables -A FORWARD -i eth2 -o eth1 -d 120.0.48.7 -p tcp --dport 20 -j ACCEPT
    # VOIP tout autoriser pour le moment
    iptables -A FORWARD -o eth1 -d 120.0.48.6 -j ACCEPT
    #iptables -A FORWARD -i eth2 -o eth1 -d 120.0.48.6 -p tcp --dport 5060 -j ACCEPT
    #iptables -A FORWARD -i eth2 -o eth1 -d 120.0.48.6 -p udp --dport 5060 -j ACCEPT
    #iptables -A FORWARD -i eth2 -o eth1 -d 120.0.48.6 -p tcp --dport 5061 -j ACCEPT
    #iptables -A FORWARD -i eth2 -o eth1 -d 120.0.48.6 -p udp --dport 5061 -j ACCEPT
    # Autoriser les connections déjà établie 
    # (pour le retour notamment, évite de gérer les port de sources)
    iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT"
