ARG NGINX_VERSION=1.17.9
FROM nginx:${NGINX_VERSION}

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080