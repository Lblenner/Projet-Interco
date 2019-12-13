#!/bin/bash

sudo docker run -dit --name install --net=host --cap-add=NET_ADMIN debian;
sudo docker exec install bash -c "apt update;
                            apt install -y tshark;"
sudo docker commit install debianwire
sudo docker stop install
sudo docker rm install

