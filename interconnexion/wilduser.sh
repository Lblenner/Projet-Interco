#!/bin/bash

sudo docker exec wilduser bash -c "
    ip addr del default;
    ip addr add default via 192.168.3.2"