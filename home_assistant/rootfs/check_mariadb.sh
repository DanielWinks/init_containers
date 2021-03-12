#!/bin/ash

check_mariadb() {
    mysql --protocol=tcp -h mariadb.db \
    -uroot -p$MARIADB_ROOT_PASSWORD -e "show databases;"\
    | grep $HOME_ASSISTANT_DB >/dev/null
}
check_mariadb
connected=$?
until [ "$connected" -eq 0 ]; do
    check_mariadb
    connected=$?
    echo "Waiting for connection to mariadb..."
    sleep 5s
done
echo "Successfully connected to $HOME_ASSISTANT_DB mariadb database."