cd ${'/var/www/apiapp'}
composer install --no-dev
sudo chown -R :www-data /var/www/apiapp
sudo chmod -R 775 /var/www/apiapp/storage
cp .env.example .env
php artisan key:generate
sudo nano .env
php artisan migrate
php artisan db:seed

php -m
php -m | grep openssl