
将若干个磁盘分区连接为一个整块的卷组 （volumegroup），形成一个存储池。


# 基本术语

- 物理卷（Physical Volume，PV）

  指磁盘分区或从逻辑上与磁盘分区具有同样功能的设备（如RAID），是LVM的基本存储逻辑块

- 卷组（Volume Group，VG）

  由一个或多个物理卷PV组成。可以在卷组上创建一个或多个LV（逻辑卷）。

- 逻辑卷（Logical Volume，LV）

  逻辑卷建立在卷组VG之上。在逻辑卷LV之上可以建立文件系统（比如/home或者/usr等）。


# 创建管理

1. 创建分区

```
# fdisk -l
# fdisk /dev/vdb

Command (m for help): n # 新建分区
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p): # 默认，回车
Using default response p
Partition number (1-4, default 1): # 默认，回车
First sector (2048-2097151999, default 2048): # 默认，回车
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-2097151999, default 2097151999): # 默认，回车
Using default value 2097151999
Partition 1 of type Linux and of size 1000 GiB is set

Command (m for help): t # 修改分区格式
Selected partition 1
Hex code (type L to list all codes): 8e   # 8e为Linux LVM格式
Changed type of partition 'Linux' to 'Linux LVM'


Command (m for help): p # 查看已经创建的分区

Disk /dev/vdb: 1073.7 GB, 1073741824000 bytes, 2097152000 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x063d7ae1

   Device Boot      Start         End      Blocks   Id  System
/dev/vdb1            2048  2097151999  1048574976   8e  Linux LVM

Command (m for help): w    # 保存修改
```

2. 创建物理卷

创建物理卷的命令为pvcreate，利用该命令将希望添加到卷组的所有分区或者磁盘创建为物理卷。将整个磁盘创建为物理卷的命令为：

```
# pvcreate /dev/hdb
```

将单个分区创建为物理卷的命令为：

```
# pvcreate /dev/hda5
```

列出所有的物理卷：

```
# pvdisplay
```

3. 创建卷组

创建卷组的命令为vgcreate，将使用pvcreate建立的物理卷创建为一个完整的卷组：

```
# vgcreate data /dev/hda5 /dev/hdb
```

vgcreate命令第一个参数是指定该卷组的逻辑名：web_document。后面参数是指定希望添加到该卷组的所有分区和磁盘。vgcreate 在创建卷组web_document以外，还设置使用大小为4MB的PE（默认为4MB），这表示卷组上创建的所有逻辑卷都以4MB为增量单位来进行扩充 或缩减。由于内核原因，PE大小决定了逻辑卷的最大大小，4MB的PE决定了单个逻辑卷最大容量为256GB，若希望使用大于256G的逻辑卷则创建卷组 时指定更大的PE。PE大小范围为8KB到512MB，并且必须总是2的倍数（使用-s指定，具体请参考manvgcreate）。（centos 6.2系统已发现没有这种限制）

查看所有的卷组：

```
# vgdisplay
```

4. 激活卷组

为了立即使用卷组而不是重新启动系统，可以使用vgchange来激活卷组：

```
# vgchange -ay web_document
```

5. 添加新的物理卷到卷组中

当系统安装了新的磁盘并创建了新的物理卷，而要将其添加到已有卷组时，就需要使用vgextend命令：

```
# vgextend data /dev/hdc1
```

6. 从卷组中删除一个物理卷

要从一个卷组中删除一个物理卷，首先要确认要删除的物理卷没有被任何逻辑卷正在使用，就要使用pvdisplay命令察看一个该物理卷信息：

如果某个物理卷正在被逻辑卷所使用，就需要将该物理卷的数据备份到其他地方，然后再删除。删除物理卷的命令为vgreduce：

```
# vgreduce data /dev/hda1
```

7. 创建逻辑卷

创建逻辑卷的命令为lvcreate：

```
lvcreate -L1500 -n www1 web_document
```

该命令就在卷组web_document上创建名字为www1，大小为1500M的逻辑卷，并且设备入口为 /dev/web_document/www1（web_document为卷组名，www1为逻辑卷名）。如果希望创建一个使用全部卷组的逻辑卷，则需要首先察看该卷组的PE数，然后在创建逻辑卷时指定：

#vgdisplay web_document | grep"TotalPE"
TotalPE45230
#lvcreate -l45230 web_document -n www1

```
# lvcreate -l 100%FREE -n lv_data data
```

`-l 100%FREE`: 大小为卷组所有剩余的空间

`-n lv_data`: 逻辑卷的名称

查看所有的逻辑卷：

```
# lvdisplay
```

## 逻辑卷扩容

`vgs查看卷组剩余大小`

```
# vgs
VG #PV #LV #SN Attr   VSize VFree
cl   2   3   0 wz--n- 1.19t 960.00g
```

`扩容:`

```
lvextend -L +64G /dev/cl/swap
```

### swap 扩容

```
# sync
# swapoff /dev/cl/swap
# mkswap /dev/cl/swap
# swapon /dev/cl/swap
# free -h
total        used        free      shared  buff/cache   available
Mem:           5.2G        2.4G        1.1G         14M        1.7G        2.7G
Swap:           65G          0B         65G
```

8. 创建文件系统

```
mkfs.xfs -f /dev/data/lv_data
```

如果希望系统启动时自动加载文件系统，则还需要在/etc/fstab中添加内容：

```
/dev/mapper/data-lv_data /data xfs defaults 0 0
```

# 参考文献

- [LVM](https://baike.baidu.com/item/LVM/6571177?fr=aladdin)
