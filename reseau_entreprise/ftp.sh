#!/bin/bash

sudo docker exec ftp bash -c "
    ip route add default via 120.0.48.7"
