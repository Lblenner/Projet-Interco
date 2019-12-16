#!/bin/bash

sudo docker run -dit --name install --net=host --cap-add=NET_ADMIN debian;
sudo docker exec install bash -c "apt-get update &&
                            apt-get install -y curl &&
                            apt-get install -y tshark && 
                            apt-get install -y quagga &&
                            apt-get install -y iptables &&
                            apt-get install -y vim &&
                            rm -rf /var/lib/apt/lists/*"
sudo docker commit install debian_custom
sudo docker stop install
sudo docker rm install

