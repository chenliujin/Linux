
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
- [Linux 格式化和挂载数据盘](https://help.aliyun.com/document_detail/25426.html?spm=5176.7738005.2.1.3LXGcb)
- [扩容数据盘_Linux](https://help.aliyun.com/document_detail/25452.html?spm=5176.10695662.1996646101.searchclickresult.12b5e5c6tD0Rd8)    
