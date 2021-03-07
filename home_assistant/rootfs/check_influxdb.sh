#!/bin/ash

check_influxdb() {
    influx -host influxdb.db \
    -username $INFLUXDB_ADMIN_USER -password \
    $INFLUXDB_ADMIN_PASSWORD -execute "SHOW DATABASES;"\
    | grep home_assistant >/dev/null
}
check_influxdb
connected=$?
until [ "$connected" -eq 0 ]; do
    check_influxdb
    connected=$?
    echo "Waiting for connection to influxdb..."
    sleep 5s
done
echo "Successfully connected to home_assistant influxdb database."