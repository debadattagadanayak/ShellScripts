#!/bin/bash

sudo su

# Update packages
sudo yum update -y

# Install Java Development Kit (JDK)
sudo yum install -y java-1.8.0-openjdk-devel  # Replace with the appropriate package for your distribution

cd /opt

#Download tomcat binary
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.82/bin/apache-tomcat-9.0.82.tar.gz

#make a folder and unzip tomcat binary
mkdir -p /opt/tomcat
tar -zxf apache-tomcat-9.0.82.tar.gz -C /opt/tomcat --strip-components=1

#go to tomcat bin directory
cd /opt/tomcat/bin/

#gve executable permission to startup and shutdown
chmod +x startup.sh
chmod +x shutdown.sh

#create 2 symbolic link for starting and stutting down tomcat
ln -s /opt/tomcat/bin/startup.sh /usr/bin/tomcatup
ln -s /opt/tomcat/bin/shutdown.sh /usr/bin/tomcatdown

tomcatup
