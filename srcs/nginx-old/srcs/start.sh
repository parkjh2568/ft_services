#rc-status && touch /run/openrc/softlevel
/usr/sbin/sshd
#rc-service sshd restart
#rc-service nginx restart
nginx -g "daemon off;"
