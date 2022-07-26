#!/bin/bash
#######################################   VARIABLES ###################################################
IFS=":"
os_name="ubuntu:centos:other_install_with_dnf"
os_version=$(sudo cat /etc/os-*ea* | grep -i pretty_name | cut -d "\"" -f2 | cut -d " " -f2)

###################################### BEGIN APT INSTALLATION ##########################################
ansibleUbuntu(){
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
}
###################################### END APT INSTALLATION ###########################################
###################################### BEGIN YUM INSTALLATION ##########################################
ansibleCentos(){
yum install epel-release -y
sudo yum install ansible -y
ansible --version
}
###################################### END YUM INSTALLATION ###########################################
###################################### BEGIN DNF INSTALLATION ##########################################
ansibleDnf(){
sudo dnf install python3 python3-pip -y
sudo dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf install  --enablerepo epel-playground  ansible
ansible --version
}
###################################### END DNF INSTALLATION ###########################################

echo "|Select your vesion to install ansible >>"
echo ""
select var in $os_name
do
        echo $var
        if [[ $var == "ubuntu" ]]
        then
               ansibleUbuntu
        elif [[ $var == "centos" ]]
        then
                ansibleCentos
        elif [[ $var == "other_install_with_dnf" ]]
        then
                ansibleDnf
        fi
 done
 echo -n "Reload the procedure.sh and go the the next step >>"
 echo -n " ETAPE n°2
=========================================
 |===>  GENERATINGSSHKEY
=========================================
"
