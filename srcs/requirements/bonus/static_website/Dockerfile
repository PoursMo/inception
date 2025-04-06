FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y \
	nginx \
	openssl

# generate ssl key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/static.42.fr.key \
	-out /etc/ssl/certs/static.42.fr.crt \
	-subj "/C=CH/L=Lausanne/O=42/CN=aloubry"

# setup config file
COPY conf/static.42.fr.conf /etc/nginx/conf.d

# put static website in the right place
COPY sources/ /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]