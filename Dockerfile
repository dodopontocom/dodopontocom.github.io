from nginx:alpine

ADD ./ /usr/share/nginx/html

#docker run --name constru --rm -it -d -p 8080:80 test:latest
