#!/bin/bash
sudo rm -rf /var/www/mobapp /var/www/webapp /var/www/apiapp /home/mobapp.git /home/webapp.git /home/apiapp.git
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
sudo cat > hooks/post-receive << ENDOFFILE
#!/bin/sh
git --work-tree=/var/www/mobapp --git-dir=${MOB} checkout -f
ENDOFFILE
sudo chmod +x ${MOB}/hooks/post-receive

sudo mkdir -p ${WEB}
cd ${WEB}
git init --bare

sudo cat > hooks/post-receive << ENDOFFILE
#!/bin/sh
git --work-tree=/var/www/webapp --git-dir=${WEB} checkout -f
ENDOFFILE
sudo chmod +x ${WEB}/hooks/post-receive

sudo mkdir -p ${API}
cd ${API}
git init --bare
sudo cat > hooks/post-receive << ENDOFFILE
#!/bin/sh
git --work-tree=/var/www/apiapp --git-dir=${API} checkout -f
ENDOFFILE
sudo chmod +x ${API}/hooks/post-receive

# sudo apt-get update
# sudo apt-get install nginx
# sudo apt-get install mysql-server
# sudo mysql_secure_installation
# sudo apt-get install php-fpm php-mysql php-mbstring
# sudo nginx -t
# sudo systemctl reload nginx




