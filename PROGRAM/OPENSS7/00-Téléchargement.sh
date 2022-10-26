#!/bin/bash

ARRAY=( "smstools" "wvdial")

sudo apt-get update
for i in "${!ARRAY[@]}"
do   
      echo " Installation de pré-requis n°$((i+1)): ${ARRAY[$i]}"
      sudo  apt-get install -y ${ARRAY[$i]}
      sudo apt-get clean packages
done
                   
sleep 5

echo "| Détection du port de connection ..."
sudo wvdialconf

sleep 5

echo "| Vérification du status de  SMS Server TOOLS ..."
var_server=`sudo /etc/init.d/smstools status | grep "active\|running"` 

if [[ $var_server ]]
then
        
        echo "| Arret de SMS Server TOOLS ..."
        sudo /etc/init.d/smstools stop
        sleep 2
        echo "| Le serveur est arrété "
else
        echo "| Le serveur est déja arrété"

fi
sleep 5 
echo "| Création d'une sauvegarde de la configuration originale"
sudo cp /etc/smsd.conf /etc/smsd.conf.originale
sleep 3
echo "| Fin de l'installation de SMS Server Tools 3"
echo "| "
echo "| Veuillez passer à l'étape de configuration ..."

