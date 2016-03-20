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
