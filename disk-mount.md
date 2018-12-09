# 当硬盘大于2T时，用parted命令。
```
parted /dev/sdb   (用part命令对3T硬盘进行分区处理）  
mklabel gpt       (用gpt格式可以将3TB弄在一个分区里)  
unit TB           (设置单位为TB)  
mkpart primary 0 3 (设置为一个主分区,大小为3TB，开始是0，结束是3）  
print              (显示设置的分区大小）  
quit               (退出parted程序)  
```

---

```
$ df -h 
$ fdisk -l

# 分区
$ fdisk /dev/vdb
- 输入 `n` 并按回车键：创建一个新分区。
- w 保存修改

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
