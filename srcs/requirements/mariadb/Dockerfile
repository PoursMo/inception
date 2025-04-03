FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server

# setup config files
COPY conf/50-server.cnf /etc/mysql/mariabd.conf.d/
COPY conf/init.sql /etc/mysql/init.sql
# setup entrypoint script
COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# create necessary directory
RUN mkdir /run/mysqld

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mariadbd-safe"]