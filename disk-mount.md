
```
$ df -h 
$ fdisk -l

# 分区
$ fdisk /dev/vdb

# 格式化
$ mkfs.ext4 /dev/vdb1

# 挂载
$ mkdir /data
$ mount /dev/vdb1 /data

# 保存分区信息
$ echo /dev/vdb1 /data ext4 defaults 0 0 >> /etc/fstab
$ cat /etc/fstab
```

# 参考文献
- https://help.aliyun.com/document_detail/25426.html?spm=5176.7738005.2.1.3LXGcb
