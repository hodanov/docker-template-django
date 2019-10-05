FROM postgres:12.0-alpine
ENV LANG ja_JP.utf8

ENV POSTGRES_DB='postgres'
ENV POSTGRES_USER='postgres'
ENV POSTGRES_PASSWORD='postgres'

WORKDIR /docker-entrypoint-initdb.d

RUN apk --no-cache update && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
