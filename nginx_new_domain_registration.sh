#!/bin/bash
#echo "test"

filestr=""
input1=$1
from_copy=$2
while read line; do
       rline=$(echo "${line}" | sed -e "s/{host}/${input1}/g")   
       filestr="${filestr}${rline}\n"    
done < $from_copy

echo $filestr >> /etc/nginx/sites-available/$input1
sudo mkdir -p /var/www/$input1
echo "hello_world" >> /var/www/$input1/index.html
sudo chown -R $USER:$USER /var/www/$input1/
sudo ln -s /etc/nginx/sites-available/$input1 /etc/nginx/sites-enabled/
sudo service nginx restart
