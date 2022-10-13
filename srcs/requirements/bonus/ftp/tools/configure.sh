#!/bin/sh

adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd
mkdir -p /var/ftp
chown -R $FTP_USER:$FTP_USER /var/ftp
echo $FTP_USER >> /etc/vsftpd.user_list

mv /jail.local /etc/fail2ban/jail.local
if [ ! -f "/var/log/vsftpd.log" ]; then
	touch /var/log/vsftpd.log
fi
rm -rf /etc/fail2ban/jail.d
fail2ban-server -x -b start

/usr/sbin/vsftpd /vsftpd.conf
