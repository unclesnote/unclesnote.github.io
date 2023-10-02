---
title:  How to extend swap size on the Ubuntu
categories: [Ubuntu]
tags: [Ubuntu, Memory, Swap]
description:  In Ubuntu, swap is a concept that corresponds to Windows' virtual memory, and when physical memory is insufficient, files are used as memory. Post how to create and register swap files in Ubuntu. This post is based on Ubuntu 20.04 version. In some cases, building large packages can fail due to low memory. However, having enough swap files will help you build successfully.
toc: true
# Below is readonly values if it's decided once
layout: post
date: 2023-09-28 21:34:25 +0900
ro_id: 230928213425
ro_name: how_to_extend_swap_size_on_the_ubuntu
ro_ref: 230928213425/how_to_extend_swap_size_on_the_ubuntu
lang: en
---
In Ubuntu, swap is a concept that corresponds to Windows' virtual memory, and when physical memory is insufficient, files are used as memory. Post how to create and register swap files in Ubuntu. This post is based on Ubuntu 20.04 version.  
In some cases, building large packages can fail due to low memory. However, having enough swap files will help you build successfully.  
## 1. Check swap
The free command shows the status of the swap, and generally the swapfile exists in the root directory.  

```bash
$ free -m
              total        used        free      shared  buff/cache   available
Mem:           4913        1306        2306           8        1300        3359
Swap:          8191           0        8191
$ ls -la /
total 8388712
...
-rw-------   1 root root   8589934592 Jul 24 17:54 swapfile
...
```
## 2. Create swapfile
I used to use 8 gigabytes of swapfile, but I'm going to resize it to 5 gigabytes because I don't have enough disk space.  

```bash
# off swap & remove existing swapfile 
sudo swapoff -v /swapfile
sudo rm /swapfile
# create swapfile 
sudo fallocate -l 5G /swapfile
sudo chmod 600 /swapfile 
# activate swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```
**Example :**  

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
## 3. Register swapfile
I will modify /etc/fstab and set it to load the swapfile at every boot.  

```bash
$ sudo vi /etc/fstab    
# add below in /etc/fstab
/swapfile              none            swap    sw              0       0
```
## 4. Reboot
Reboot first. After rebooting, you can check the swap file generated above on the system monitor.  
![swapfile-ubuntu-system-monitor](/assets/images/230928213425/swapfile-ubuntu-system-monitor.png)  
