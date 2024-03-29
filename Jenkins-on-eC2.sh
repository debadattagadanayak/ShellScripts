#!/bin/bash

# Update packages
sudo yum update -y

# Add Jenkins repository

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import key file
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Upgrade packages
sudo yum upgrade

# Install Java
sudo amazon-linux-extras install java-openjdk11 -y

# Install Jenkins
sudo yum install jenkins -y

sleep 10s

# Enable jenkins too run any command without asking password
echo 'jenkins ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers

sleep 10s

# Enable Jenkins service to start at boot
sudo systemctl enable jenkins

sleep 10s

# Start Jenkins as a service
sudo systemctl start jenkins

sleep 10s

# Check the status of the Jenkins service
sudo systemctl status jenkins

