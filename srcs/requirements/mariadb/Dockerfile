FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server

# setup config file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# setup entrypoint script
COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["mariadbd-safe"]