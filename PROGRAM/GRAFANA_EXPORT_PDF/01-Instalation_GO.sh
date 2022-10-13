#!/bin/bash

go_version="go1.19.2.linux-amd64.tar.gz"


echo "Téléchargement de GO, version:$go_version"
echo " |==>"
sudo wget https://dl.google.com/go/$go_version

echo "Décompression du fichier de GO, version:$go_version"
echo " |==>"
sudo tar -C /usr/local -xzf $go_version

echo "Export du fichier dans /usr/local/go/bin"
echo " |==>"
export PATH=$PATH:/usr/local/go/bin

echo "Vérification de la version GO"
echo " |==>"
go version
