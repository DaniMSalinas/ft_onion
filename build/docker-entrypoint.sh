#! /bin/bash

/etc/init.d/ssh start
/usr/sbin/tor &
/usr/sbin/nginx -g "daemon off;"
