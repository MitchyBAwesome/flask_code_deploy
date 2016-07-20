#!/bin/bash
cd /var/www/html/myapp
virtualenv myappenv
source myappenv/bin/activate
pip install gunicorn flask
deactivate
sudo chown -R www-data:www-data /var/www/html/myapp
sudo chmod -R 770 /var/www/html/myapp/
stop myapp
start myapp
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled
sudo service nginx restart
