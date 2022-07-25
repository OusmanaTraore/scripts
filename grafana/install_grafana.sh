############################### BEGIN OF INSTALLATION OF GRAFANA ##############################
       read -p "Please enter grafana version to install" GRAFANA_VERSION
###OPTION 1
       wget https://dl.grafana.com/oss/release/grafana-$GRAFANA_VERSION.darwin-amd64.tar.gz 
    tar -zxvf grafana-$GRAFANA_VERSION.darwin-amd64.tar.gz

### OPTION 2 
       https://dl.grafana.com/oss/release/grafana-$GRAFANA_VERSION.x86_64.rpm
          
sudo yum install initscripts urw-fonts

sudo yum localinstall

#################
### START UP THE GRAFANA WITH SYSTEMD 
systemctl daemon-reload
systemctl start grafana-server
systemctl status grafana-server

sudo systemctl enable grafana-server.service
############################### END OF INSTALLATION OF GRAFANA ##############################
        
