#!/bin/bash
cd /tmp
echo "| Getting Telegraf Package ..."
wget https://dl.influxdata.com/telegraf/releases/telegraf_1.7.1-1_amd64.deb
echo "| Depackaging Telegraf  ..."
sudo dpkg -i telegraf_1.7.1-1_amd64.deb


echo "| Starting Telegraf  ..."
sudo systemctl start telegraf
echo "| Checking  Telegraf Status ..."
sudo systemctl status telegraf | grep active

echo "| Start configuring file /etc/telegraf/telegraf.conf ..."

sudo sed -i '$ a database = "influx_db_telegraf" ' /etc/telegraf/telegraf.conf
sudo sed -i '$ a username = "telegraf_user" ' /etc/telegraf/telegraf.conf
sudo sed -i '$ a password = "telegraf_password" ' /etc/telegraf/telegraf.conf
sleep 2

echo " | Checking the config file ..."
sudo cat /etc/telegraf/telegraf.conf | tail -5

echo " | Restarting Telegraf ..."
sudo systemctl restart telegraf

echo "| Checking  Telegraf Status ..."
sudo systemctl status telegraf | grep active


