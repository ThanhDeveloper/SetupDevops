#!/bin/bash
echo "Script is running"

# update pkg server
apt-get update
apt-get upgrade

#install ec2 instance connect
sudo apt-get install ec2-instance-connect 

# install docker
if [ -x "$(command -v docker)" ]; then
    echo "docker installed -- ignore and update"
    apt-get upgrade docker-ce
else
    echo "Installing docker"
    apt install docker.io
fi

apt-get install docker-compose-plugin

echo "Docker installed"

#install vcs
GIT_VERSION="$(git --version)"
if [ "$GIT_VERSION" != "command not found" ]; then
    echo "VCS installed -- ignore"
else
    echo "Installing git"
    apt install git
    git --version
    echo "VCS installed"
fi

docker -v
docker compose version

echo "Setup completed!"
