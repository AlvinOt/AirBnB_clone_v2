#!/usr/bin/env bash
# Set up web servers for static website deployment:

if ! which nginx > /dev/null 2>&1;
then
    sudo apt-get update
    sudo apt-get -y install nginx
    sudo ufw allow 'Nginx HTTP'
fi

if [[ ! -e /data/web_static/releases/test ]];
then
    mkdir -p /data/web_static/releases/test
fi

if [[ ! -e /data/web_static/shared ]];
then
    mkdir -p /data/web_static/shared
fi

ln -sfn /data/web_static/releases/test /data/web_static/current

echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html

chown -R ubuntu:ubuntu /data/

echo "
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        location /hbnb_static {
            alias /data/web_static/current/;
        }

        add_header X-Served-By $HOSTNAME;

        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGU1\wu4 \
permanent;
}" > /etc/nginx/sites-available/default

service nginx restart
