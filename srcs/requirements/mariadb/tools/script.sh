#!/bin/bash

service mysql start 

echo "create database if not exists $MYSQL_DATABASE ;" > db1.sql
echo "create user if not exists '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD' ;" >> db1.sql
echo "grant all privileges on $db1_name.* to '$MYSQL_USER'@'%' ;" >> db1.sql
echo "alter user 'root'@'localhost' identified by 'MYSQL_ROOT_PASSWORD' ;" >> db1.sql
echo "flush privileges;" >> db1.sql

mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
