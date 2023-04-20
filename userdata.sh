#!/bin/bash

# Update packages
sudo yum update -y

# Install GIT
sudo yum install git -y

# Clone the GIT repo
git clone https://github.com/debadattagadanayak/ShellScripts.git

#become root user
sudo su

#Go to the Folder
cd ShellScripts

#Give executable permission to the script
chmod +x Jenkins-on-eC2.sh

#Run Script
sudo ./Jenkins-on-eC2.sh