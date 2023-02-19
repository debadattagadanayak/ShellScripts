#!/bin/bash

sudo su

# Update packages
sudo yum update -y

# Install git
sudo yum install git -y

# Install wget
sudo yum install -y wget unzip

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import key file
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Upgrade packages
sudo yum upgrade -y

# Install Java
sudo amazon-linux-extras install java-openjdk11 -y

# Install Teraform
sudo wget https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_amd64.zip
sudo unzip terraform_1.0.8_linux_amd64.zip -d /usr/local/bin/
sudo rm terraform_1.0.8_linux_amd64.zip
sudo echo "export PATH=$PATH:/usr/local/bin" >> ~/.bashrc

# Install Jenkins
sudo yum install jenkins -y

# Enable Jenkins service to start at boot
sudo systemctl enable jenkins

# Start Jenkins as a service
sudo systemctl start jenkins

# remove ask for password
echo 'jenkins ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers

# Check the status of the Jenkins service
sudo systemctl status jenkins

