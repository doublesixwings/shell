#!/bin/bash
#升级内核
wget https://www.moerats.com/usr/down/CentOS_Kernel/kernel-ml-4.12.10-1.el7.elrepo.x86_64.rpm && wget https://www.moerats.com/usr/down/CentOS_Kernel/kernel-ml-devel-4.12.10-1.el7.elrepo.x86_64.rpm && wget https://www.moerats.com/usr/down/CentOS_Kernel/kernel-ml-headers-4.12.10-1.el7.elrepo.x86_64.rpm
yum -y install kernel-ml-4.12.10-1.el7.elrepo.x86_64.rpm
yum -y install kernel-ml-devel-4.12.10-1.el7.elrepo.x86_64.rpm
yum -y install kernel-ml-headers-4.12.10-1.el7.elrepo.x86_64.rpm
#centos 6
#sed -i '/default=/d' /boot/grub/grub.conf && echo -e "\ndefault=0\c" >> /boot/grub/grub.conf
#centos 7
grub2-set-default 0
reboot
