#!/usr/bin/bash

# Update and upgrade packages
echo -e "\033[1;33mUpdating and upgrading packages...\033[0m"
sudo apt-get update
sudo apt-get upgrade -y

# Install Git
echo -e "\033[1;33mInstalling git...\033[0m"
sudo apt-get install git -y

# Install Midnight Commander (mc)
echo -e "\033[1;33mInstalling Midnight Commander (mc)...\033[0m"
sudo apt-get install mc -y

# Install lz4 (lzc)
echo -e "\033[1;33mInstalling lz4/lzc...\033[0m"
sudo apt-get install lz4 -y

# Enable scrolling in screen
echo -e "\033[1;33mChecking if ~/.screenrc exists for enabling scrolling in screen...\033[0m"
if [ ! -f ~/.screenrc ]; then
    echo "termcapinfo xterm* ti@:te@" > ~/.screenrc
    echo "~/.screenrc file created."
else
    echo "~/.screenrc file already exists. No changes made."
fi

# Install Docker
echo -e "\033[1;33mInstalling Docker...\033[0m"
#curl -fsSL https://get.docker.com -o get-docker.sh
#sudo sh get-docker.sh
echo "Docker installation complete."

# Use docker without sudo
echo -e "\033[1;33m Use docker without sudo...\033[0m"
#sudo groupadd docker
#sudo usermod -aG docker $USER
echo -e "\033[1;33m !!! YOU NEED TO LOGOUT and LOGIN AGAIN to RUN DOCKER without SUDO\033[0m"
echo -e "\033[1;33m then try: docker run hello-world \033[0m"

# Configure Docker to start on boot with systemd
echo -e "\033[1;33m Configure Docker to start on boot with systemd...\033[0m"
#sudo systemctl enable docker.service
#sudo systemctl enable containerd.service

# Install Portainer
echo -e "\033[1;33m Install Portainer \033[0m"
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
