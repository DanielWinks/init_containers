#!/bin/ash

mysql -h $HOSTNAME -uroot -p$MYSQL_ROOT_PASSWORD -e \
    "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"

mysql -h $HOSTNAME -uroot -p$MYSQL_ROOT_PASSWORD -e \
    "CREATE USER IF NOT EXISTS '$MARIADB_USER' IDENTIFIED \
    BY '$MARIADB_USER_PASSWORD';"

mysql -h $HOSTNAME -uroot -p$MYSQL_ROOT_PASSWORD -e \
    "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' \
    IDENTIFIED BY '$MARIADB_USER_PASSWORD';"

mysql -h $HOSTNAME -uroot -p$MYSQL_ROOT_PASSWORD -e \
    "FLUSH PRIVILEGES;"

mysql -h $HOSTNAME -uroot -p$MYSQL_ROOT_PASSWORD -e \
    "show databases;"

mysql -h $HOSTNAME -uroot -p$MYSQL_ROOT_PASSWORD -e \
    "select host, user from mysql.user;"