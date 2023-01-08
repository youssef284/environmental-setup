#!/bin/sh
ssh-keygen -A
nginx 
exec /usr/sbin/sshd -D -e "$@"
