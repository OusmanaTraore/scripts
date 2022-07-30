installINfluxDB(){
IFS=":"
os_version="ubuntu:almalinux"
select var in $os_version
do
        if [[ $os_version == "ubuntu" ]]
        then
                sudo curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
                sudo echo "deb https://repos.influxdata.com/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

                sudo apt update
                sudo apt install influxdb

                sudo systemctl stop influxdb
                sudo systemctl start influxdb
                sudo systemctl enable --now influxdb
                sudo systemctl is-enabled influxdb

                sudo systemctl status influxdb
                        
        elif [[ $os_version == "almalinux" ]];
        then
                editInfluxRepo(){
                sudo tee  /etc/yum.repos.d/influxdb.repo \ 
                <<  
                EOF  
                [influxdb]
                name = InfluxDB Repository
                baseurl = https://repos.influxdata.com/rhel/8/x86_64/stable/
                enabled = 1
                gpgcheck = 1
                gpgkey = https://repos.influxdata.com/influxdb.key
                EOF

                }
                sudo dnf update
                sudo dnf install influxdb
                sudo systemctl start influxdb
                sudo systemctl enable influxdb
                sudo firewall-cmd --add-port=8086/tcp --permanent
                sudo firewall-cmd --reload
                ### MAKE THE SUITE 
                https://www.how2shout.com/linux/how-to-install-influxdb-on-almalinux-or-rocky-8-to-create-database/
        fi
done

}

editInfluxDB(){
sudo nano /etc/influxdb/influxdb.conf

[http]
# Determines whether HTTP endpoint is enabled.
enabled = true
# Determines whether the Flux query endpoint is enabled.
# flux-enabled = false
}
createUser(){
sudo systemctl restart influxdb

curl -XPOST "http://localhost:8086/query" --data-urlencode "q=CREATE USER superadmin WITH PASSWORD 'type_password_here' WITH ALL PRIVILEGES"

influx -username 'superadmin' -password 'your_password_here'
}
testConnection(){
curl -G http://localhost:8086/query -u superadmin:password_here --data-urlencode "q=SHOW DATABASES"
}
installInfluxDB
