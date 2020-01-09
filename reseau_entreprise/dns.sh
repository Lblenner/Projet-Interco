#!/bin/bash

sudo docker exec dns bash -c "
    ip route add default via 120.0.48.5"
