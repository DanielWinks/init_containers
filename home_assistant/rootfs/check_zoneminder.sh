#!/bin/ash

check_zoneminder() {
    curl -IL http://zoneminder.home/zm/ \
    2>/dev/null | head -n 1 | cut -d$' ' -f2 \
    | grep 200 >/dev/null
}
check_zoneminder
connected=$?
until [ "$connected" -eq 0 ]; do
    check_zoneminder
    connected=$?
    echo "Waiting for connection to zoneminder..."
    sleep 5s
done
echo "Successfully connected to zoneminder."
