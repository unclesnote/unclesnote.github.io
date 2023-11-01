---
title:  How to increase swapfile size in Ubuntu
image:
  path: /assets/images/231102005313/en-thumb-swapfile-system-monitor-swap.png
  alt: How to increase swapfile size in Ubuntu
images: ["/assets/images/231102005313/swapfile-system-monitor-swap.png"]
categories: [Ubuntu, Common]
tags: [fatab, Swap, swapfile, Ubuntu, Common]
description:  Sometimes, if Ubuntu's physical memory is insufficient and the OS continues to operate, performance may drop or build errors may occur when compiling a large platform or BSP. Therefore, Linux-based OS creates a swapfile and uses files on the hard disk as memory when physical memory is insufficient. This is similar to virtual memory in the Windows environment. Now, I would like to explain how to create and apply a swapfile in Ubuntu 20.04.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 00:53:13 +0900
ro_id: 231102005313
ro_name: how_to_increase_swapfile_size_in_ubuntu
ro_ref: 231102005313/how_to_increase_swapfile_size_in_ubuntu
lang: en
---
Sometimes, if Ubuntu's physical memory is insufficient and the OS continues to operate, performance may drop or build errors may occur when compiling a large platform or BSP. Therefore, Linux-based OS creates a swapfile and uses files on the hard disk as memory when physical memory is insufficient. This is similar to virtual memory in the Windows environment.  
Now, I would like to explain how to create and apply a swapfile in Ubuntu 20.04.  
## Check swap
Use the `free -m` command to check the swap status in my Ubuntu environment. And check whether there is a `swapfile` in the system `root`. It is common to create a swap file in the root path.  
In my case, I am using 2GB of swap and the swapfile is in the root path.  

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
## Create swapfile
I will delete the existing 2GB swapfile and create a new 5GB swapfile.  
First, turn off the swap function and delete the 2GB swap file already in use.  

```shell
sudo swapoff -v /swapfile
sudo rm /swapfile
```
Then, we will create a 5GB swapfile in the root and assign the file permission to 600.  

```shell
sudo fallocate -l 5G /swapfile
sudo chmod 600 /swapfile 
```
And finally, activate swap with the newly created file.  

```bash
sudo mkswap /swapfile
sudo swapon /swapfile
```
Below is how I executed the above commands.  

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
## Register swapfile
Now, finally, we will configure Ubuntu to load the swapfile every time it boots.  
Then, open `/etc/fstab`.  

```shell
sudo vi /etc/fstab    
```
And add the line below. If it is already set, you do not need to add it.  

```shell
/swapfile              none            swap    sw              0       0
```
## Reboot
Reboot first. After rebooting, you can check the swap file generated above on the system monitor.  
![`Applications` Menu > System Monitor](/assets/images/231102005313/swapfile-system-monitor-swap.png)  

`Applications` Menu > System Monitor
{: style="color:gray; font-size: 80%; text-align: center;"}

