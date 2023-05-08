#!/bin/bash

# installing packages
yum install wget unzip httpd -y

#start and enable apache
systemctl start httpd
systemctl enable httpd

#download artifact from tooplate
wget https://www.tooplate.com/zip-templates/2124_vertex.zip

#unzip and copy artifacts to /var/www/html
unzip -o 2124_vertex.zip
cp -r 2124_vertex/* /var/www/html

#restart apache
systemctl restart httpd