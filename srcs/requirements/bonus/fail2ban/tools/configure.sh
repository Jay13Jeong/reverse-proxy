#!/bin/sh

mv /jail.local /etc/fail2ban/jail.local
if [ ! -f "/var/log/vsftpd.log" ]; then
	touch /var/log/vsftpd.log
fi
rm -rf /etc/fail2ban/jail.d
fail2ban-server -x -f start
