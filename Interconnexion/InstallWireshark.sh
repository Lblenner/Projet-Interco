#!/bin/bash

sudo docker run -dit --name install --net=host --cap-add=NET_ADMIN debian;
sudo docker exec install bash -c "apt update;
                            apt install tshark;"
sudo docker commit install debianwire
