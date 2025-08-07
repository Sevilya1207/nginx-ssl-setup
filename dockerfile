FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
  nginx \
  certbot \
  python3-certbot-nginx \
  curl \
  cron \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY ./site /var/www/site

COPY ./site.conf /etc/nginx/sites-available/default
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./renew-cert.sh /usr/local/bin/renew-cert.sh
RUN chmod +x /usr/local/bin/renew-cert.sh

COPY ./crontab.txt /etc/cron.d/certbot-renew
RUN chmod 0644 /etc/cron.d/certbot-renew \
  && crontab /etc/cron.d/certbot-renew

EXPOSE 80 443

CMD service cron start && nginx -g 'daemon off;'
