#!/bin/bash

# Update package list
sudo yum update  # For Amazon Linux 2, or use the appropriate package manager command for your distribution

# Install Java Development Kit (JDK)
sudo yum install -y java-1.8.0-openjdk-devel  # Replace with the appropriate package for your distribution

# Install Docker
sudo yum install -y docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl start docker
