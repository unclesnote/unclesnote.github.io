---
title:  如何增加 Ubuntu 中的交换文件大小
image:
  path: /assets/images/231102005313/zh-thumb-unclesnote-how_to_increase_swapfile_size_in_ubuntu.png
  alt: 如何增加 Ubuntu 中的交换文件大小
images: ["/assets/images/231102005313/unclesnote-how_to_increase_swapfile_size_in_ubuntu-applications_menu_system_monitor.png"]
categories: [乌班图, 常见的]
tags: [法塔布, 交换, 交换文件, 乌班图, 常见的]
description:  有时，如果 Ubuntu 的物理内存不足而操作系统继续运行，则在编译大型平台或 BSP 时可能会出现性能下降或出现构建错误。因此，当物理内存不足时，基于Linux的操作系统会创建交换文件并使用硬盘上的文件作为内存。这类似于Windows环境中的虚拟内存。现在，我想解释一下如何在 Ubuntu 20.04 中创建和应用交换文件。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 00:53:13 +0900
ro_id: 231102005313
ro_name: how_to_increase_swapfile_size_in_ubuntu
ro_ref: 231102005313/how_to_increase_swapfile_size_in_ubuntu
lang: zh
---
有时，如果 Ubuntu 的物理内存不足而操作系统继续运行，则在编译大型平台或 BSP 时可能会出现性能下降或出现构建错误。因此，当物理内存不足时，基于Linux的操作系统会创建交换文件并使用硬盘上的文件作为内存。这类似于Windows环境中的虚拟内存。  

现在，我想解释一下如何在 Ubuntu 20.04 中创建和应用交换文件。  
## 检查掉期
使用 `free -m` 命令检查我的 Ubuntu 环境中的交换状态。并检查系统`root`中是否存在`swapfile`。在根路径中创建交换文件是很常见的。  

就我而言，我使用 2GB 交换空间，交换文件位于根路径中。  

````bash
$ free -m
              total        used        free      shared  buff/cache   available
Mem:           4913        1306        2306           8        1300        3359
Swap:          2048           0        2048
$ ls -la /
total 8388712
...
-rw-------   1 root root   2048934592 Jul 24 17:54 swapfile
...
````
## 创建交换文件
我将删除现有的 2GB 交换文件并创建一个新的 5GB 交换文件。  

首先，关闭交换功能并删除已经使用的2GB交换文件。  

```shell
sudo swapoff -v /swapfile
sudo rm /swapfile
```
然后，我们将在根目录中创建一个5GB的交换文件，并将文件权限分配为600。  

```shell
sudo fallocate -l 5G /swapfile
sudo chmod 600 /swapfile 
```
最后，用新创建的文件激活交换。  

```bash
sudo mkswap /swapfile
sudo swapon /swapfile
```
以下是我执行上述命令的方法。  

```bash
$ sudo swapoff -v /swapfile
[sudo] password for bull: 
swapoff /swapfile
$ sudo rm /swapfile
$ sudo fallocate -l 5G /swapfile
$ ls -l /
total 5242976
...
-rw-r--r--   1 root root   5368709120 Aug 17 14:11 swapfile
...
$ sudo chmod 600 /swapfile 
$ sudo mkswap /swapfile
Setting up swapspace version 1, size = 5 GiB (5368705024 bytes)
no label, UUID=747f641b-70cc-449c-b719-e54154ad8194
$ sudo swapon /swapfile
```
## 注册交换文件
现在，最后，我们将配置 Ubuntu 在每次启动时加载交换文件。  

然后，打开`/etc/fstab`。  

```shell
sudo vi /etc/fstab    
```
并添加下面的行。如果已经设置，则无需添加。  

```shell
/swapfile              none            swap    sw              0       0
```
## 重启
首先重新启动。重新启动后，您可以在系统监视器上查看上面生成的交换文件。  
![`应用程序`菜单 > 系统监视器](/assets/images/231102005313/unclesnote-how_to_increase_swapfile_size_in_ubuntu-applications_menu_system_monitor.png)  

`应用程序`菜单 > 系统监视器
{: style="color:gray; font-size: 80%; text-align: center;"}

