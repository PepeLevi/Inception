#!/bin/bash

sed -i "s/__MYSQL_ROOT_PASSWORD__/$MYSQL_ROOT_PASSWORD/g" /install.txt;

if [ ! -d "/var/lib/mysql/$db_name" ]; then
    echo "Starting MariaDB service..."
    service mariadb start

	    # Wait for MariaDB service to fully start
            sleep 5

    echo "Running mysql_secure_installation..."
    mysql_secure_installation < /install.txt

    echo "Creating database, user, and granting privileges..."
    mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $db_name ;"
    mariadb -u root -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;"
    mariadb -u root -e "GRANT ALL ON *.* TO '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;"
    mariadb -u root -e "FLUSH PRIVILEGES;"
    mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";
    mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

    echo "Stopping MariaDB service..."
    service mariadb stop
fi

echo "Executing mysqld_safe..."
exec mysqld_safe --bind-address=0.0.0.0 --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid
