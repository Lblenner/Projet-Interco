#!/bin/bash

sudo docker exec voip bash -c "
    ip route add default via 120.0.48.6"
