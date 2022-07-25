#/bin/bash

### THIS SCRIPTS WAS TESTED ON ALMALINUX ####

# Adding the Docker repository
echo '| Adding the Docker repository...>> '
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo


# REMOVING PODMAN AND BUILDAH
echo '| Removing podman and buildah >> '
sudo dnf remove podman buildah

# INSTALLATION OF DOCKER AND DOCKER-COMPOSE
echo '| Installation of docker-ce, docker-ce-li, containerd.io >> '
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y


# ENABLE SERVICES AND START
echo '| ENABLE and start the service >> '
sudo systemctl enable docker.service
sudo systemctl start docker.service
sleep 1
# CHECKING STATUS
echo '| Checking status >> '
sudo systemctl status docker.service | grep Active

# CHECKING VERSIONS
echo '| Checking docker Version >> '
sudo docker version 
sleep 2
# CHECKING VERSION
echo '| Checking docker compose Version >> '
sudo docker compose version 
sleep 2
# GET DOCKER INFO
echo '| Getting docker info >> '
sudo docker info
sleep 1
# ADDING USER TO DOCKER
echo '| Adding user to docker >> '
sudo usermod -aG docker $USER

# RESTART THE SYSTEM
echo '| The system will restart in order to take effect of changes... >> '
sleep 2
reboot
