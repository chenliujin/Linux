

```
nmtui edit enp2s0

systemctl restart network.service
```





# vim /etc/sysconfig/network-scripts/ifcfg-enp2s0
```
BOOTPROTO=static/dhcp
IPADDR=192.168.0.100
NETMASK=255.255.255.0
GATEWAY=192.168.0.1

ONBOOT=yes
DNS1=114.114.114.114
DNS2=8.8.8.8
```
