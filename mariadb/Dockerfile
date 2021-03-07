FROM alpine:3.13

LABEL author="Daniel Winks"

RUN apk --no-cache add mariadb-client

COPY createdb.sh /createdb.sh

RUN chmod +x /createdb.sh

CMD ["/createdb.sh"]
