FROM alpine:3.13.12

RUN	apk update && apk upgrade \
&& apk add --no-cache vsftpd fail2ban

COPY conf/jail.local /jail.local
COPY conf/vsftpd.conf /vsftpd.conf
COPY tools/configure.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]