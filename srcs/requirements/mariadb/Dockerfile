FROM alpine:3.13.12

RUN	apk update && \
        apk upgrade && \
        apk add --no-cache mariadb mariadb-client

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf        
COPY tools/configure.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]
# CMD [ "exec", "mysqld", "--user=mysql", "--console" ]