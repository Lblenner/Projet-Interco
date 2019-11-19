#!/bin/bash


sudo docker create --name pc1 --cap-add=NET_ADMIN debian
sudo docker create --name pc2 --cap-add=NET_ADMIN debian
sudo docker start pc1
sudo docker start pc2

docker run -net none --name pc1 -- cap-add=NET_ADMIN debian
gnome-terminal -x sh -c "./r1.sh; bash"
sudo pipework br1 -i eth1 $(sudo docker ps -aqf "name=pc1") 0/0
sudo pipework br1 -i eth1 $(sudo docker ps -aqf "name=pc2") 0/0
sudo pipework br1 -i eth1 $(sudo docker ps -aqf "name=pc1") 0/0