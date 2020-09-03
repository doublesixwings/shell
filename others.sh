#!/bin/bash
parted -s /dev/vdb mklabel gpt
parted -s /dev/vdb unit mib mkpart primary 0% 100%
mkfs.ext4 /dev/vdb1
mkdir /mnt/blockstorage
echo /dev/vdb1               /mnt/blockstorage       ext4    defaults,noatime,nofail 0 0 >> /etc/fstab
mount /mnt/blockstorage

mkdir -p /mnt/blockstorage/www/html/aria2/download
yum -y install httpd
cd /mnt/blockstorage/www/html
git clone https://github.com/binux/yaaw

iptables -I INPUT -m state --state NEW -m udp -p udp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 51413 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 51413 -j ACCEPT
service iptables save
service iptables restart

yum -y install make gcc
wget -O ./tcp_tsunami.c https://www.moerats.com/usr/down/CentOS_Kernel/tcp_tsunami.c
echo "obj-m:=tcp_tsunami.o" > Makefile
make -C /lib/modules/`uname -r`/build M=`pwd` modules CC=/usr/bin/gcc
chmod +x ./tcp_tsunami.ko
cp -rf ./tcp_tsunami.ko /lib/modules/`uname -r`/kernel/net/ipv4
insmod tcp_tsunami.ko
depmod -a
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=tsunami" >> /etc/sysctl.conf
sysctl -p
