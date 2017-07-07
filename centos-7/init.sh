#!/bin/bash

# network
sed -i "s/ONBOOT=no/ONBOOT=yes/" /etc/sysconfig/network-scripts/ifcfg-eth0
ifup eth0

yum install -y rsync tree
yum install -y net-tools
yum install -y vim screen
yum install -y epel-release
#yum install -y git

# 时间同步
yum install -y ntp
systemctl enable ntpd
systemctl start ntpd

## selinux
setenforce 0
sed -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config

# iptables


# ssh-keygen -t rsa -C liujin.chen@qq.com

# hostname
hostnamectl set-hostname vm01x
