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
$ yum install net-tools
```

## VIM
```
$ yum install vim
```

## rsync
```
$ yum install rsync
```

## JAVA
```
$ yum install java java-1.8.0-openjdk-devel
```

## screen
```
$ yum install screen
```

## 同步时间
```
$ yum install rdate
# crontab
*/30 * * * * rdate -s time.nist.gov > /dev/null
```
## selinux
```
$ setenforce 0  

$ vim /etc/selinux/config
SELINUX=disabled  

```



* tree
* Git

## 防火墙
* iptables初始化
