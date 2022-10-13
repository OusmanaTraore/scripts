#!/bin/bash

port_="8686"
echo " Update de la database"
sudo dnf makecache --refresh
echo " |==>"

echo " Installation de Sendmail "
echo " |==>"
sudo dnf -y install sendmail
