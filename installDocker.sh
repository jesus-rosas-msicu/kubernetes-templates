#!/bin/bash
#Author Jesus Rosas
#Install docker with one function

docker_install(){
    echo "[X] Updating and adding repository"
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    echo "[x] Updating the System after addint the repositories"
    sudo apt update
    apt-cache policy docker-ce
    echo "[X] Installing docker"
    sudo apt install docker-ce -y
    echo "[x] Addint user $USER to the docker group"
    sudo usermod -aG docker ${USER}
}

docker_install