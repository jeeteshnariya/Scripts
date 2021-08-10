#!/bin/bash
sudo rm -rf /var/www/mobapp
sudo rm -rf /var/www/webapp
sudo rm -rf /var/www/apiapp
sudo rm -rf /home/mobapp.git 
sudo rm -rf /home/webapp.git 
sudo rm -rf /home/apiapp.git 


echo "Creating folders"
sudo mkdir -p /var/www/mobapp
sudo mkdir -p /var/www/webapp
sudo mkdir -p /var/www/apiapp

echo "Creating git init --bare"

MOB='/home/mobapp.git'     
WEB='/home/webapp.git'     
API='/home/apiapp.git'     

sudo mkdir -p /home/mobapp.git 
cd ${MOB}
git init --bare

sudo mkdir -p /home/webapp.git 
cd ${WEB}
git init --bare

sudo mkdir -p /home/apiapp.git 
cd ${API}
git init --bare


echo "Done git init --bare"
