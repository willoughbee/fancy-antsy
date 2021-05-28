#!/bin/bash

# Dotnet Install
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
apt-get update
apt-get install -y apt-transport-https
apt-get update
apt-get install -y dotnet-sdk-5.0
apt-get install -y dotnet-sdk-3.1

apt-get update
apt-get install -y apt-transport-https
apt-get update
apt-get install -y aspnetcore-runtime-5.0
apt-get install -y aspnetcore-runtime-3.1

sudo apt-get install -y dotnet-runtime-5.0
sudo apt-get install -y dotnet-runtime-3.1

# Covenant Pull
git clone --recurse-submodules https://github.com/cobbr/Covenant /opt/Covenant
