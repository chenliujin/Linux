## network
```
$ cd /etc/sysconfig/network-scripts/
$ vi ifcfg-ens33
ONBOOT=yes
DNS1=8.8.8.8

$ service network restart
```

## JAVA
```
$ yum install java java-1.8.0-openjdk-devel
```
