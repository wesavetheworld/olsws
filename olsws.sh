#!/bin/bash
# -*- ENCODING: UTF-8 -*-
rpm -ivh http://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el6.noarch.rpm
yum -y update
echo -e "System updated"



yum -y install epel-release
yum -y install gcc gcc-c++ make autoconf glibc rcs
yum -y install pcre-devel openssl-devel expat-devel geoip-devel zlib-devel


yum install openlitespeed-1.4.15 -y
yum install lsphp54-* --skip-broken -y
ln -sf /usr/local/lsws/lsphp54/bin/lsphp /usr/local/lsws/fcgi-bin/lsphp5
/usr/local/lsws/bin/lswsctrl start


echo -e "The default port for the WebAdmin console is 7080"
echo -e "By default, OpenLiteSpeed runs on port 8088"
echo -e "The defaults for the administrator's user name and password are: admin and 123456"



