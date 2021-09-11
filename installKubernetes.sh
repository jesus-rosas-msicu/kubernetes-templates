#!/bin/bash
#Author Jesus Rosas
#Install kubernetes with a simple script
#Version 1.20
#Reference minikube
#https://phoenixnap.com/kb/install-minikube-on-ubuntu#ftoc-heading-7

kubectl_install(){
    echo "[X] Updating and adding repository"
    sudo apt update
    curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.20.4/2021-04-12/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
    echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
    kubectl version --short --client
}

minikube_install(){
    echo "Updating a system"
    sudo apt-get update -y
    sudo apt-get install curl -y
    sudo apt-get install apt-transport-https -y 
    sudo apt install virtualbox virtualbox-ext-pack -y
    wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo cp minikube-linux-amd64 /usr/local/bin/minikube
    sudo chmod 755 /usr/local/bin/minikube
    minikube start --vm-driver=none
    minikube status
}

kubectl_install
minikube_install