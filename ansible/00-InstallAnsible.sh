#!/bin/bash
echo "|Installaion of Ansible >>"
sudo apt update
echo "|Configuration of sudo user >>"
echo "sysops ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/sysops
sleep 2
echo " |Upgrade of ubuntu >>"
sudo apt upgrade -y
#echo "|Rebooting the system"
#sudo reboot
echo "|Installation of dependencies and configure Ansible Repository >>"
sudo apt install  software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
echo "|Update the repository >>"
sudo apt update
sudo apt install -y ansible
echo "|Check the version of ansible >>"
ansible --version
