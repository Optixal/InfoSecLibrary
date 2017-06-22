# uWSGI + Nginx + Flask

https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-ubuntu-16-04#create-a-systemd-unit-file

```sh
sudo apt-get update
sudo apt-get install python3-pip python3-dev nginx
sudo pip3 install virtualenv
virtualenv -p /usr/bin/python3.5 --no-site-packages env
source env/bin/activate
pip install uwsgi flask
sudo ufw allow 8080 # port that web server is running on
# Create flask app project.py
# Create wsgi.py
uwsgi --socket 0.0.0.0:8080 --protocol=http -w wsgi:app
# Create ini file project.ini
uwsgi --ini project.ini # once ini file is created use this

# Stopped here, uWSGI on its own seems good enough for most needs
# https://serverfault.com/questions/590819/why-do-i-need-nginx-when-i-have-uwsgi

# Create uwsgi service project.service for systemctl
sudo systemctl start project
# Create nginx server /etc/nginx/sites-available/project
sudo ln -s /etc/nginx/sites-available/project /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
#sudo sg www-data -c '/path/to/project/env/bin/uwsgi --ini project.ini' # use this if you dont want uwsgi to be a service
```
