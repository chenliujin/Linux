
# 目标服务器（k4）

### rsyncd 配置
```
```

### 开机启动
```
$ systemctl enable rsyncd
$ systemctl start  rsyncd
```

---

# 源服务器（k2）

### 安装 inotify
```
$ yum install -y inotify-tools
```

### inotity 同步脚本
```
```

### systemd service
```
```

---


# 参考文献
- [Ubuntu14.04 实现rsync+inotify 实时同步文件](https://www.cnblogs.com/qinhir/p/6589403.html)
