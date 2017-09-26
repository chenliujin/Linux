

# download
-[163](http://mirrors.163.com/centos/7.3.1611/isos/x86_64/)

## 单用户修改 root 密码
- 参考：http://blog.csdn.net/myth_hg/article/details/44727647，方法二
- 启动时，随便按一个键，空格即可
- 按 e 编辑
```
ro vconsole.keymap 修改为
rw init=/sysroot/bin/sh vconsole.keymap
```

然后 Ctrl + x 启动

现在你可以进入单用户模式了
依次输入以下命令进行root密码修改，`修改完成之后强制重启即可。`   
chroot /sysroot/
passwd 
touch / .autorelabel
