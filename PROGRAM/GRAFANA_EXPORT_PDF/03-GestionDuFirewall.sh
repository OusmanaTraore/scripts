#!/bin/bash

port_="8686"
echo " Ajout du port $port_"
sudo systemctl start firewalld
echo " |==>"
sudo firewall-cmd --zone=public --permanent --add-port=$port_/tcp

echo " Reload du firewall "
echo " |==>"
sudo firewall-cmd --reload
