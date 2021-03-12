FROM alpine:3.13

LABEL author="Daniel Winks"

RUN apk --no-cache add influxdb mariadb-client curl

COPY home_assistant/rootfs /

CMD ["/bin/ash"]
