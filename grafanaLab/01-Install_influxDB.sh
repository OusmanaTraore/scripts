#!/bin/bash

cd /tmp
echo " | Getting influxd packages...    >>"
wget -q https://repos.influxdata.com/influxdb.key
echo '23a1c8836f0afc5ed24e0486339d7cc8f6790b83886c4c96995b88a061c5bb5d influxdb.key' | sha256sum -c && cat influxdb.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdb.gpg > /dev/null
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdb.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list

# Updating and installing Influxdb2
echo " | Update and install influxdb2   >>"
sudo apt-get update -y && sudo apt-get install influxdb2 -y

# Starting Influxd 
echo " | Starting influxd    >>"
sudo systemctl start influxd

tryCreate(){
echo " | Creating influx Database and User    >>"
sudo influx -execute "CREATE DATABASE influx_db_telegraf"
if [[ $? -eq 0 ]]
then
        sudo influx -execute "CREATE USER telegraf_user WITH PASSWORD 'telegraf_password'"
        sudo influx -execute "GRANT ALL ON influx_db_telegraf TO telegraf_user"
        echo " | Creating Retention Policy..  default value: 52 weeks  >>"
        sudo influx -execute "CREATE RETENTION POLICY "a_year" ON "influx_db_telegraf" DURATION 52w REPLICATION 1 DEFAULT"
elif [[ $? -ne 0 ]]
then
        cd /usr/bin
        ./influx
        CREATE USER telegraf_user WITH PASSWORD 'telegraf_password'
        GRANT ALL ON influx_db_telegraf TO telegraf_user
        CREATE RETENTION POLICY a_year ON influx_db_telegraf DURATION 52w REPLICATION 1 DEFAULT
fi
}
tryCreate
