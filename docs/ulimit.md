```
# ulimit -a
core file size          (blocks, -c) 0
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 14573
max locked memory       (kbytes, -l) 64
max memory size         (kbytes, -m) unlimited
open files                      (-n) 1024
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) 8192
cpu time               (seconds, -t) unlimited
max user processes              (-u) 14573
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited
```

$ ulimit -n 65535

$ vim /etc/profile
ulimit -SHn 65535

```
# vim /etc/security/limits.conf
* soft nofile 204800  
* hard nofile 204800  
* soft nproc 204800  
* hard nproc 204800
```

# 参考文献
* https://blog.csdn.net/xuchuangqi/article/details/78989884

<h2>�ο�����</h2>
<ul>
	<li>http://www.linuxfly.org/post/73/</li>
	<li>http://man.linuxde.net/ulimit</li>
	<li><a href="http://happyqing.iteye.com/blog/1953563">linux�޸������ļ�������open files</a></li>
	<li><a href="https://www.ibm.com/developerworks/cn/linux/l-cn-ulimit/">ͨ�� ulimit ����ϵͳ����</a></li>
</ul>
