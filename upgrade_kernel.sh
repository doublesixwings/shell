<<<<<<< HEAD
#!/bin/bash
#升级内核
wget https://www.moerats.com/usr/down/CentOS_Kernel/kernel-ml-4.12.10-1.el6.elrepo.x86_64.rpm && wget https://www.moerats.com/usr/down/CentOS_Kernel/kernel-ml-devel-4.12.10-1.el6.elrepo.x86_64.rpm && wget https://www.moerats.com/usr/down/CentOS_Kernel/kernel-ml-headers-4.12.10-1.el6.elrepo.x86_64.rpm
yum -y install kernel-ml-4.12.10-1.el6.elrepo.x86_64.rpm
yum -y kernel-ml-devel-4.12.10-1.el6.elrepo.x86_64.rpm
yum -y kernel-ml-headers-4.12.10-1.el6.elrepo.x86_64.rpm
sed -i '/default=/d' /boot/grub/grub.conf && echo -e "\ndefault=0\c" >> /boot/grub/grub.conf
reboot
=======
#!/bin/bash
#升级内核
wget https://www.moerats.com/usr/down/CentOS_Kernel/kernel-ml-4.12.10-1.el6.elrepo.x86_64.rpm && wget https://www.moerats.com/usr/down/CentOS_Kernel/kernel-ml-devel-4.12.10-1.el6.elrepo.x86_64.rpm && wget https://www.moerats.com/usr/down/CentOS_Kernel/kernel-ml-headers-4.12.10-1.el6.elrepo.x86_64.rpm
yum -y install kernel-ml-4.12.10-1.el6.elrepo.x86_64.rpm
yum -y kernel-ml-devel-4.12.10-1.el6.elrepo.x86_64.rpm
yum -y kernel-ml-headers-4.12.10-1.el6.elrepo.x86_64.rpm
sed -i '/default=/d' /boot/grub/grub.conf && echo -e "\ndefault=0\c" >> /boot/grub/grub.conf
reboot
>>>>>>> defc324e2af8d1e0fa988b76ad8b968121e4625b
