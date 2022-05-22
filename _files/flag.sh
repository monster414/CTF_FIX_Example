#!/bin/sh

# Create database and user
# mysql -e "create database ctfhub;" -uroot -proot
# mysql -e "grant select,insert,update,delete on ctfhub.* to ctfhub@'127.0.0.1' identified by 'ctfhub';" -uroot

# Set dynamic FLAG

touch /flag
echo $FLAG > /flag
mv /tmp/check /check
mv /tmp/check.py /check.py
mv /tmp/index.php /var/www/html/index.php
chmod +x 777 /var/www/html/index.php
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
chmod +s /check /check.py
chmod 400 /flag
useradd ctf
echo "ctf:123456" | chpasswd
ln -s /usr/bin/python3 /usr/bin/python
chmod 777 /var/www/html/index.php
chmod 777 /var/www/html/*
service ssh start

# if [[ -f /var/www/html/db.sql ]]; then
#     sed -i "s#FLAG#$FLAG#" /var/www/html/db.sql || true
# fi

# mysql -e "USE $FLAG_SCHEMA;ALTER TABLE FLAG_TABLE CHANGE FLAG_COLUMN $FLAG_COLUMN CHAR(128) NOT NULL DEFAULT 'not_flag';ALTER TABLE FLAG_TABLE RENAME $FLAG_TABLE;INSERT $FLAG_TABLE VALUES('$FLAG');" -uroot -proot
# mysql -e "USE $FLAG_SCHEMA;UPDATE $FLAG_TABLE SET $FLAG_COLUMN='$FLAG'" -uroot -proot


# Reset mysql root's passwors as random string
#mysql -uroot -proot -e "UPDATE mysql.user SET Password=PASSWORD(substring(MD5(RAND()),1,20)) WHERE user='root';"

export FLAG=not_flag
FLAG=not_flag

rm -f /flag.sh
rm -rf /tmp/*