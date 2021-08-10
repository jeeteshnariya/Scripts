#!/bin/bash

echo "Creating folders"
sudo mkdir -p /var/www/mobapp
sudo mkdir -p /var/www/webapp
sudo mkdir -p /var/www/apiapp

echo "Creating git init --bare"

sudo mkdir -p /home/mobapp.git && sudo cd /home/mobapp.git && git init --bare
sudo mkdir -p /home/webapp.git && sudo cd /home/webapp.git && git init --bare
sudo mkdir -p /home/apiapp.git && sudo cd /home/apiapp.git && git init --bare

echo "Done git init --bare"
