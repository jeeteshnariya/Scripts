#!/bin/bash
echo "Do you want to install php ?"
read  x
if [[ "${x}" = "yes" ]]
then
read -p  "Enter PHP Version  : " version
echo 
echo "Entered PHP version is - $version"
echo "=================================="
sudo apt-get update -y
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/nginx
sudo apt-get update
sudo apt-get install -y php$version
sudo apt install php$version-bcmath -y
sudo apt install php$version-fpm -y
sudo apt install php$version-common php$version-mysql php$version-xml php$version-xmlrpc php$version-curl php$version-gd php$version-imagick php$version-cli php$version-dev php$version-imap php$version
sudo update-alternatives --config php
else
echo "php installation option is not chosen"
fi
echo "Do you want to install nodejs ?"
read x
if [[ "${x}" = "yes" ]]
then
sudo apt install curl
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh -o install_nvm.sh
bash install_nvm.sh
source ~/.profile
source /home/ubuntu/.nvm/nvm.sh
nvm --version

read -p  "Enter Node Version (preceding with v)  : " version
echo 
echo "Entered Node version is - $version"
echo "=================================="
nvm install $version
nvm use $version
nvm alias default $version
else 
echo "Node js installation option is not chosen"
fi
echo "Do you want to install nginx ?"
read x
if [[ "${x}" = "yes" ]]
then 
sudo apt update
sudo apt install nginx
sudo systemctl status nginx.service
else
echo "nginx installation is not chosen"
fi


echo "Do you want to install Mysql ?"
read x
if [[ "${x}" = "yes" ]]
then 
sudo apt update

# The latest source code can be found at https://gist.github.com/rponte/7561856

set -e # Exit script immediately on first error.
#set -x # Print commands and their arguments as they are executed.

# Check if MySQL environment is already installed
RUN_ONCE_FLAG=~/.mysql_env_build_time
MYSQL_PASSWORD="password"

if [ -e "$RUN_ONCE_FLAG" ]; then
  echo "MySQL Server environment is already installed."
  exit 0
fi

# Update Ubuntu package index
sudo apt-get update -y

# Installs MySQL 5.7
echo "mysql-server-5.7 mysql-server/root_password password $MYSQL_PASSWORD" | sudo debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password $MYSQL_PASSWORD" | sudo debconf-set-selections
sudo apt-get install -y mysql-server-5.7 mysql-client

# Configures MySQL
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
sudo sed -i '/\[mysqld\]/a\lower_case_table_names=1' /etc/mysql/my.cnf
echo "MySQL Password set to '${MYSQL_PASSWORD}'. Remember to delete ~/.mysql.passwd" | tee ~/.mysql.passwd; 
mysql -uroot -p$MYSQL_PASSWORD -e "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;";
sudo service mysql restart

# Installs basic dependencies
sudo apt-get install -y unzip git curl

# Configures prompt color
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc
echo 'source ~/.bashrc' >> ~/.bash_profile
source ~/.bash_profile

# Cleaning unneeded packages
sudo apt-get autoremove -y
sudo apt-get clean

# sets "run once" flag
date > $RUN_ONCE_FLAG

else
echo "MySQL installation is not chosen"
fi
