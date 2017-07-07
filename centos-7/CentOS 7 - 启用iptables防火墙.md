## 关闭firewall
```
#停止 firewall
$ systemctl stop firewalld.service

#禁止 firewall 开机启动
$ systemctl disable firewalld.service
```











## 开放端口
* --permanent 永久生效，没有此参数重启后失效
```
$ firewall-cmd --zone=public --add-port=80/tcp --permanent
$ firewall-cmd --zone=public --add-port=3306/tcp --permanent
$ firewall-cmd --reload

# 查询
$ firewall-cmd --zone=public --query-port=80/tcp

# 删除
$ firewall-cmd --zone=public --remove-port=80/tcp --permanent
```
