#!/bin/ash

check_postgresqldb() {
  mysql --protocol=tcp -h mariadb.db \
  -u$MYSQL_USER -p$MYSQL_ROOT_PASSWORD -e "show databases;"\
  | grep home_assistant >/dev/null
}
check_mariadb
connected=$?
until [ "$connected" -eq 0 ]; do
  check_mariadb
  connected=$?
  echo "Waiting for connection to mariadb..."
  sleep 5s
done
echo "Successfully connected to home_assistant mariadb database."