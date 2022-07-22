#!/bin/bash

############################ VARIABLES ###################################





############################ VARIABLES ###################################
#========================================================================#

echo "| Update of system...>>"
sudo dnf update
echo "| List mysql module available>>"
sudo dnf module list mysql
echo "| Enabling module ...>>"
read -p "| Choose the module e.g \"8.0\" >> " choose
sudo dnf module enable mysql:$choose
echo "| Installation of mysql>>"
sudo dnf install @mysql
echo "| Enabling mysqld ...>>"
sudo systemctl enable mysqld
echo "| Starting mysqld ...>>"
sudo systemctl start mysqld
sleep 2
echo "| Check Status mysqld >>"
sudo systemctl status mysqld | grep Active
echo "| mysql_secure_installation>>"
sudo mysql_secure_installation

echo -n "| Connect to mysql by typing
==>
sudo mysql -u root -p
==>
SELECT VERSION ();
>>"


