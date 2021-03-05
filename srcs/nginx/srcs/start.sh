#!/bin/sh

rc-status && touch /run/openrc/softlevel
rc-service sshd start
#nginx -g "daemon off;"
