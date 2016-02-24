#!/bin/bash
# -*- ENCODING: UTF-8 -*-
# Miguel Salcedo <imiguelsalcedo at hotmail dot com>

# Update
echo -e "\n --------In five seconds the system upgrade will start--------\n"
sleep 5

yum -y update
echo -e "System updated"
sleep 2

# Dependencies
echo -e "\n --------Installing dependencies--------\n"
sleep 3
yum -y install epel-release
yum -y install gcc gcc-c++ make autoconf glibc rcs
yum -y install pcre-devel openssl-devel expat-devel geoip-devel zlib-devel

# OpenLiteSpeed
echo -e "\n ---------Installing openlitespeed--------\n"
sleep 3

rpm -ivh http://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el6.noarch.rpm
yum -y install openlitespeed
yum -y install lsphp54 lsphp54-common lsphp54-gd lsphp54-process lsphp54-mbstring lsphp54-mysql lsphp54-xml lsphp54-mcrypt lsphp54-pdo lsphp54-imap

#Symbolic link
echo e- "\n ---------Symbolic link----------\n" 
ln -sf /usr/local/lsws/lsphp54/bin/lsphp /usr/local/lsws/fcgi-bin/lsphp5
sleep 2
echo -e "\nIt may have worked \e[1;32m:)\e[0m"
echo -e "\n\nThe default installation directory is /usr/local/lsws"
echo -e "Start= /usr/local/lsws/bin/lswsctrl start"
echo -e "Stop=  /usr/local/lsws/bin/lswsctrl stop"
echo -e "The default port for the WebAdmin console is 7080"
echo -e "By default, OpenLiteSpeed runs on port 8088"
echo -e "The defaults for the administrator's user name and password are: admin and 123456"
echo -e "\n Uninstallation Steps"
echo -e "Stop OpenLiteSpeed if it is running: /usr/local/lsws/bin/lswsctrl stop"
echo -e "Remove the install directory: rm -rf /usr/local/lsws"

exit
