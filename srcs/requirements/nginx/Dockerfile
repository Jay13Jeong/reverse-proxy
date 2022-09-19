FROM alpine:3.13.12

RUN	apk update && \
        apk upgrade && \
        apk add nginx openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/jjeong_ssl.pem \
        -keyout /etc/nginx/ssl/jjeong_ssl.key \
        -subj "/C=Cl/ST=Seoul/L=Seoul/O=42 School/OU=jjeong/CN=jjeong/"

# nginx config
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
