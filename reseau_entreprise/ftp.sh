#!/bin/bash

sudo docker exec ftp bash -c "ip route del default
    ip route add default via 120.0.48.3;
    
    /etc/init.d/vsftpd start"
