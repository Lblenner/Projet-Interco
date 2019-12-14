#!/bin/bash

sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)
sudo docker network rm $(sudo docker network ls -q)
