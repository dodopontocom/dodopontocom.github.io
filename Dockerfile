from nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
ADD ./ /usr/share/nginx/www

RUN mkdir -p /var/log/app_engine

#ADD www/ /usr/share/nginx/www/
RUN chmod -R a+r /usr/share/nginx/www

#docker run --name constru --rm -it -d -p 8080:80 test:latest

#RUN mkdir -p /usr/share/nginx/www/_ah && \
#    echo "healthy" > /usr/share/nginx/www/_ah/health
