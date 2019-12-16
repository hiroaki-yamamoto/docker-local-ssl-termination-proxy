FROM alpine:3.6

ENV NGINX_VERSION 1.13.5

RUN apk add --no-cache openssl nginx gettext
RUN mkdir -p /etc/nginx/ssl/
RUN openssl req -new -x509 -sha256 -newkey rsa:2048 -days 365 -nodes -out /etc/nginx/ssl/nginx.pem -keyout /etc/nginx/ssl/nginx.key -subj "/C=JP/ST=MyState/L=MyLocality/O=MyOrg/OU=dev/CN=localhost" \
RUN mkdir -p /run/nginx/

ADD nginx.conf.template /etc/nginx/nginx.conf.template
ADD entrypoint.sh .

EXPOSE 443

ENTRYPOINT ./entrypoint.sh
