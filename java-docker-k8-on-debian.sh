#!/bin/bash

# Update package list
sudo apt update

# Install Java Development Kit (JDK)
sudo apt install -y default-jdk

# Install Docker
sudo apt install -y curl
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Kubernetes
sudo apt install -y apt-transport-https gnupg2
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes.gpg
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubeadm kubelet kubectl
sudo apt-mark hold kubeadm kubelet kubectl

# Enable and start Docker and kubelet services
sudo systemctl enable docker
sudo systemctl enable kubelet
sudo systemctl start docker
sudo systemctl start kubelet
