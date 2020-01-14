#!/bin/bash
sudo docker run -dit --name install --privileged debian_custom;
sudo docker exec install bash -c "
    apt update;
    apt install -y vsftpd"

sudo docker commit install debian_ftpp
sudo docker stop install
sudo docker rm install