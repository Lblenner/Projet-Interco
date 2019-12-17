#!/bin/bash

#Installation Quagga
sudo docker run -dit --name install --net=host --cap-add=NET_ADMIN debian_custom;
sudo docker exec install bash -c "apt-get update &&
                            apt-get install quagga &&
                            apt-get install lsb-base &&
                            rm -rf /var/lib/apt/lists/*"
sudo docker commit install debian_interco
sudo docker stop install
sudo docker rm install
