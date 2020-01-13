#!/bin/bash

while read line;
do
    set -- $line
    
    sudo docker network create -d macvlan --subnet $2 $1

done < listeBridge3


while read line;
do
    set -- $line

    sudo docker run -dit --name ${1:5} --cap-add=NET_ADMIN debian_${1:0:4};

    for word in $line
    do

        if [ ${word:0:1} = "-" ]
        then
            sudo docker network connect --ip ${word:6} ${word:1:4} ${1:5}
        fi

    done

    ./${1:5}.sh
    
done < listeStation3
