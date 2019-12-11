#!/bin/bash

while read line;
do
    set -- $line

    echo $1

    for word in $line
    do

        if [ ${word:0:1} = "-" ]
        then
            echo "$word $1"
        fi
        
    done

    echo $1
     
done < listeStation3