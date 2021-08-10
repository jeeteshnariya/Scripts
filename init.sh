#!/bin/bash

echo "Creating Dir's"
sudo mkdir -p /var/www/mobapp
sudo mkdir -p /var/www/webapp
sudo mkdir -p /var/www/apiapp

echo "Creating GIT Repos"

MOB='/home/mobapp.git'  
WEB='/home/webapp.git'      
API='/home/apiapp.git'     

sudo mkdir -p ${MOB}
cd ${MOB}
git init --bare
cd ${'hooks/'}
cat > post-receive << ENDOFFILE
#!/bin/sh
git --work-tree=/var/www/mobapp --git-dir=/home/mobapp.git checkout -f
ENDOFFILE
sudo chmod +x post-receive

sudo mkdir -p ${WEB}
cd ${WEB}
git init --bare
cd ${'hooks/'}
cat > post-receive << ENDOFFILE
#!/bin/sh
git --work-tree=/var/www/webapp --git-dir=/home/webapp.git checkout -f
ENDOFFILE
sudo chmod +x post-receive

sudo mkdir -p ${API}
cd ${API}
git init --bare
cat > post-receive << ENDOFFILE
#!/bin/sh
git --work-tree=/var/www/webapp --git-dir=/home/webapp.git checkout -f
ENDOFFILE
sudo chmod +x post-receive

# sudo apt-get update
# sudo apt-get install nginx
# sudo apt-get install mysql-server
# sudo mysql_secure_installation
# sudo apt-get install php-fpm php-mysql php-mbstring
# sudo nginx -t
# sudo systemctl reload nginx




