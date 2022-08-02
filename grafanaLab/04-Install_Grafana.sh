#!/bin/bash

cd /tmp
echo "| Getting Grafana Package ..."
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_9.0.5_amd64.deb
echo "| Depackaging Grafana ..."
sudo dpkg -i grafana-enterprise_9.0.5_amd64.deb

echo "| Start grafana-server..."
sudo systemctl start grafana-server
test_status=$(sudo systemctl status grafana-server | grep active)

if [[ $test_status ]]
then
        echo -n "| You can access grafana-server via the browser on
        http://grafana_server_IP:3000"
else
        echo "| Chronograf server is not working. Fix it, please!!!"
fi

