# 查看每个物理CPU中core的个数(即核数)
```
$ cat /proc/cpuinfo| grep "cpu cores" | uniq
```
