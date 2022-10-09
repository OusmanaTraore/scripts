#!/bin/bash

port_="8686"
echo " Ajout du port $port_"
echo " |==>"
firewall-cmd --zone=public --permanent --add-port=$port_/tcp

echo " Reload du firewall "
echo " |==>"
firewall-cmd --reload
