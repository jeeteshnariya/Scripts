#!/bin/bash
sudo rm -rf /var/www/mobapp -y
sudo rm -rf /var/www/webapp -y
sudo rm -rf /var/www/apiapp -y
sudo rm -rf /home/mobapp.git -y
sudo rm -rf /home/webapp.git -y
sudo rm -rf /home/apiapp.git -y


echo "Creating folders"
sudo mkdir -p /var/www/mobapp -y
sudo mkdir -p /var/www/webapp -y
sudo mkdir -p /var/www/apiapp -y

echo "Creating git init --bare"

MOB='/home/mobapp.git'  
WEB='/home/webapp.git'      
API='/home/apiapp.git'     

sudo mkdir -p /home/mobapp.git -y 
cd ${MOB}
git init --bare

sudo mkdir -p /home/webapp.git -y 
cd ${WEB}
git init --bare

sudo mkdir -p /home/apiapp.git -y
cd ${API}
git init --bare


echo "Done git init --bare"
