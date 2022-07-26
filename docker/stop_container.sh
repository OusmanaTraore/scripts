#!/bin/bash

echo "|Stopping container >> "
docker ps -a

echo "|Enter ID of container you want to remove, press enter for all container >> " 
read c
        if [[ $c == "a" ]]
        then

                echo "| Killing all container >> "
                #docker kill $(docker ps -q )
                containerId=$(docker ps -a | cut -d " " -f1 | tail --lines=2 ) 
                while [ ! $containerId  ]
                do
                        echo " |killing container $containerId >>"
                        docker kill $containerId
                        echo "|Removing the container $containerId >>"
                        docker rm $containerId
                done 
                #docker ps -a | cut -d " " -f1 | tail --lines=2  > containerId
                #for i in $containerId
                #do
#                        echo "|Stopping the container $i >>"
#                        docker stop $i
#                        echo "|Removing the container $i >>"
#                        docker rm $i
                #done
                        container_check=$(docker ps -a | tail --lines=2)
                if [[ $container_check == " " ]]
                then
                        echo "All container has been stopped  and remove!"
                else    
                        echo " You must remove the container remaining!"
                fi

        else 
                echo "| Stopping container $c >>"
                docker stop $c
                echo "| Removing container $c >>"
                docker rm $c
        fi
        
        
