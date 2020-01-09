#!/bin/bash

while read line;
do
    set -- $line
    
    sudo docker network create -d bridge --subnet $2 $1

done < listeBridge3


while read line;
do
    set -- $line

    sudo docker run -dit --name $1 --cap-add=NET_ADMIN debian_custom;

    for word in $line
    do

        if [ ${word:0:1} = "-" ]
        then
            sudo docker network connect --ip ${word:6} ${word:1:4} $1
        fi

    done

    ./$1.sh
    
done < listeStation3
