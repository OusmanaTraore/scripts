#!/bin/bash
cd /tmp
echo "| Getting Chronograf Package ..."
wget https://dl.influxdata.com/chronograf/releases/chronograf_1.3.3.0_amd64.deb
echo "| Depackaging Chronograf ..."
sudo dpkg -i chronograf_1.3.3.0_amd64.deb

echo "| Enable and start chronograf..."
sudo systemctl enable chronograf
sudo systemctl start chronograf
test_status=$(sudo systemctl status chronograf | grep active)

if [[ $test_status ]]
then
	echo -n "| You can access chronograf via the browser on 
 	http://chronograf_server_IP:8888"
else
	echo "| Chronograf server is not working. Fix it, please!!!"
fi

