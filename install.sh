#!/bin/bash

sudo apt-get update
sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

sudo apt-get update
sudo apt-get install docker-ce

apt-get install arping bridge-utils  
git clone https://github.com/jpetazzo/pipework.git
mv pipework/pipework /usr/local/bin/pipework

sudo service docker start
docker pull debian

./Run.sh