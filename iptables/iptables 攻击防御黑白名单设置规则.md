## 版权
* 作者：<a href="http://www.chenliujin.com">陈柳锦</a>
* 主页：<a href="http://www.chenliujin.com">http://www.chenliujin.com</a>
* 邮箱：liujin.chen@qq.com

## 查看黑白名单
```
$ iptables -nL
```

## iptable 禁止指定 IP 访问

### 禁止所有 IP 对本机 80 端口的访问
```
$ iptables -I INPUT -p TCP --dport 80 -j DROP
```

### 禁止 IP 访问 80 端口
```
$ iptables -I INPUT -s 8.8.8.8 -p TCP --dport 80 -j DROP
```

### 允许 IP 访问 80 端口
```
$ iptables -I INPUT -s 8.8.8.8 -p TCP --dport 80 -j ACCEPT
```

## iptables 封/屏蔽 IP 段
```
封IP段的命令是
iptables -I INPUT -s 124.115.0.0/16 -j DROP
iptables -I INPUT -s 124.115.3.0/16 -j DROP
iptables -I INPUT -s 124.115.4.0/16 -j DROP

封整个段的命令是
iptables -I INPUT -s 124.115.0.0/8 -j DROP

封几个段的命令是
iptables -I INPUT -s 61.37.80.0/24 -j DROP
iptables -I INPUT -s 61.37.81.0/24 -j DROP
```

## 删除之前添加的规则，用 -D 参数
```
# 之前添加的规则
$ iptables -I INPUT -s 8.8.8.8 -p TCP --dport 80 -j DROP

# 现在将其删除
$ iptables -D INPUT -s 8.8.8.8 -p TCP --dport 80 -j DROP
```
