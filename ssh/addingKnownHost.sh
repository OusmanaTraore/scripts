#!/bin/bash

IFS=":"
master="172.19.195.80:172.19.195.81:172.19.195.82"
worker="172.19.195.158:172.19.195.159"
bootstrap="172.19.195.83:172.19.195.154"
master_bis="172.19.195.155:172.19.195.156:172.19.195.157"

select var in master worker bootstrap master_bis
do
        echo $var
        if [[ $var == "master" ]]
        then
                echo " you choose $var"
                for i in $master
                do
                sudo ssh "core@$i" 'sudo sed -i "s/HostbasedAuthentication no/HostbasedAuthentication yes/g" /etc/ssh/sshd_config'
                sudo ssh "core@$i" 'sudo cat /etc/ssh/sshd_config | grep HostbasedAuthentication'
                echo ""

                done
        elif [[ $var == "worker" ]]
        then
                echo " you choose $var"
        elif [[ $var == "bootstrap" ]]
        then
                echo " you choose $var"
        elif [[ $var == "master_bis" ]]
        then
                echo " you choose $var"
        else
                echo " Exiting..."
        fi
        
done
