from nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
ADD ./ /usr/share/nginx/www

RUN mkdir -p /var/log/app_engine

RUN chmod -R a+r /usr/share/nginx/www
