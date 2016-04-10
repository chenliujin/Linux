## network
```
$ cd /etc/sysconfig/network-scripts/
$ vi ifcfg-ens33
ONBOOT=yes
DNS1=8.8.8.8

$ service network restart
```

## ifconfig
```
$ yum install -y net-tools
```
