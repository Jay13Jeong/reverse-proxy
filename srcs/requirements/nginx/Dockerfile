FROM alpine:3.13.12

RUN	apk update && \
        apk upgrade && \
        apk add nginx openssl

RUN mkdir -p /etc/ssl
RUN openssl req -x509 \
-newkey rsa:2048 -nodes -out /etc/ssl/jjeong_ssl.pem -keyout /etc/ssl/jjeong_ssl.key \
-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=jjeong42/CN=jjeong/"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
