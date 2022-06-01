#!/bin/bash
echo "Script is running"

# update pkg server
apt-get update
apt-get upgrade

# install docker
if [ -x "$(command -v docker)" ]; then
    echo "docker installed -- ignore and update"
    apt-get upgrade docker-ce
else
    echo "Installing docker"
    apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    docker -v
fi

apt-get install docker-compose-plugin
docker compose version
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

echo "Setup completed!"