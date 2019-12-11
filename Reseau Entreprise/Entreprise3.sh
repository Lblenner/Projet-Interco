#!/bin/bash

while read line;
do
    sudo docker network create $line
done < listeBridge3


while read line;
do
    set -- $line

    sudo docker run -dit --name $1 --cap-add=NET_ADMIN debian;

    for word in $line
    do

        if [ ${word:0:1} = "-" ]
        then
            sudo docker network connect ${word:1} $1
        fi

    done

    ./$1.sh
    
done < listeStation3