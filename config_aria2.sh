#!/bin/bash
/etc/init.d/aria2 stop
sed -i "s@/usr/local/caddy/www/aria2/Download@/mnt/blockstorage/www/html/aria2/download@" /root/.aria2/aria2.conf
sed -i "s@peer-id-prefix=-TR2770-@#peer-id-prefix=-TR2770-@" /root/.aria2/aria2.conf
sed -i "s@user-agent=Transmission/2.77@#user-agent=Transmission/2.77@" /root/.aria2/aria2.conf
list=`wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -z "`grep "bt-tracker" /root/.aria2/aria2.conf`" ]; then
    sed -i '$a bt-tracker='${list} /root/.aria2/aria2.conf
    echo add......
else
    sed -i "s@bt-tracker.*@bt-tracker=$list@g" /root/.aria2/aria2.conf
    echo update......
fi
/etc/init.d/aria2 start
sed -i "s@/var/www/html@/mnt/blockstorage/www/html@" /etc/httpd/conf/httpd.conf
service httpd start
