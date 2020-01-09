#!/bin/bash

sudo docker exec dns bash -c "ip route del default
    ip route add default via 120.0.48.3"
