#!/bin/bash

sudo docker exec parefeu bash -c "
    echo 'nameserver 120.0.48.5' > /etc/resolv.conf;"
