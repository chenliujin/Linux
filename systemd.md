

# 查看日志
```
$ journalctl -f -u nginx
```


### rsync_upload_image.service
```
[Unit]
Description=rsync upload image

[Service]
ExecStart=/opt/rsync/bin/rsync_upload_image.sh
Restart=always
User=root
Group=root

[Install]
WantedBy=multi-user.target
```

### service
```
$ cp rsync_upload_image.service /etc/systemd/system
$ systemctl enable rsync_upload_image
$ systemctl start  rsync_upload_image
```


# 参考文献
- [Node 应用的 Systemd 启动](http://www.ruanyifeng.com/blog/2016/03/node-systemd-tutorial.html)
