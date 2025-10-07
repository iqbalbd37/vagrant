#!/bin/bash
echo "Download vagrant 2.4.9"
wget https://releases.hashicorp.com/vagrant/2.4.9/vagrant_2.4.9-1_amd64.deb

echo "Installing Vagrant..."
sudo apt install ./vagrant_2.4.9-1_amd64.deb

echo "Verifying version..."
vagrant --version



#Ref:vagrant download link 
#https://releases.hashicorp.com/vagrant/2.4.9/
