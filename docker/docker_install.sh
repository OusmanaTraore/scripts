#/bin/bash

### THIS SCRIPTS WAS TESTED ON ALMALINUX ####

# Adding the Docker repository
echo '| Adding the Docker repository...>> '
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo


# REMOVING PODMAN AND BUILDAH
echo '| Removing podman and buildah >> '
sudo dnf remove podman buildah

# INSTALLATION OF DOCKER 
echo '| Installation of docker-ce, docker-ce-li, containerd.io >> '
sudo dnf install docker-ce docker-ce-cli containerd.io -y


# ENABLE SERVICES AND START
echo '| ENABLE and start the service >> '
sudo systemctl enable docker.service
sudo systemctl start docker.service
sleep 1
# CHECKING STATUS
echo '| Checking status >> '
sudo systemctl status docker.service | grep Active

# CHECKING VERSION
echo '| Checking Version >> '
sudo docker version 

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
