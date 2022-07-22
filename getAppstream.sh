#!/bin/bash

### Cannot get Appstream  ######
dnf update -y 
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux*

sed -i 's|baseurl=http://vault.centos.org|baseurl=http://vault.epel.cloud|g' /etc/yum.repos.d/CentOS-Linux*
yum update -y
###| Cannot get  Appstream config end  |######

