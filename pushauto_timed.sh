#!/bin/bash

    echo Initializing autopush script...
    sleep 1

    while [ 1 ]
    do
        echo Autopush pending...
        git add *
        if [ $? -ne 0 ]
        then
            exit 1
        fi
        git commit -m "autopush"
        git push
        sleep 600
    done