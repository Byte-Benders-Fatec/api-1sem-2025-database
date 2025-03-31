FROM mysql:8.0

ENV MYSQL_DATABASE=database \
    MYSQL_ROOT_PASSWORD=password

COPY dump/fapg_dump.sql /docker-entrypoint-initdb.d/
