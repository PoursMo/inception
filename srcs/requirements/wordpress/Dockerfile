FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y curl php7.4-fpm php7.4-mysql

# setup config file
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

# setup workdir
RUN mkdir -p /var/www/html/wordpress.aloubry.42.fr && \
	mkdir -p /run/php && \
    chown www-data:www-data /run/php
WORKDIR /var/www/html/wordpress.aloubry.42.fr/

# setup entrypoint script
COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["php-fpm7.4", "-F"]