---
title:  Ubuntu에서 스왑 크기를 확장하는 방법
categories: [우분투]
tags: [우분투, 메모리, 교환]
description:  우분투에서 스왑은 윈도우즈의 가상 메모리에 해당하는 개념으로, 물리 메모리가 부족할 경우 파일을 메모리로 사용한다. Ubuntu에서 스왑 파일을 생성하고 등록하는 방법을 게시하세요. 본 포스팅은 Ubuntu 20.04 버전을 기준으로 작성되었습니다. 어떤 경우에는 메모리 부족으로 인해 큰 패키지를 빌드하는 데 실패할 수 있습니다. 그러나 충분한 스왑 파일이 있으면 성공적으로 빌드하는 데 도움이 됩니다.
toc: true
# Below is readonly values if it's decided once
layout: post
date: 2023-09-28 21:34:25 +0900
ro_id: 230928213425
ro_name: how_to_extend_swap_size_on_the_ubuntu
ro_ref: 230928213425/how_to_extend_swap_size_on_the_ubuntu
lang: ko
---
우분투에서 스왑은 윈도우즈의 가상 메모리에 해당하는 개념으로, 물리 메모리가 부족할 경우 파일을 메모리로 사용한다. Ubuntu에서 스왑 파일을 생성하고 등록하는 방법을 게시하세요. 본 포스팅은 Ubuntu 20.04 버전을 기준으로 작성되었습니다.  
어떤 경우에는 메모리 부족으로 인해 큰 패키지를 빌드하는 데 실패할 수 있습니다. 그러나 충분한 스왑 파일이 있으면 성공적으로 빌드하는 데 도움이 됩니다.  
## 1. 스왑 확인
free 명령은 스왑 상태를 보여주며 일반적으로 스왑 파일은 루트 디렉터리에 존재합니다.  

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
## 2. 스왑 파일 생성
예전에는 스왑파일 8GB를 사용했는데 디스크 공간이 부족해서 5GB로 조정하겠습니다.  

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
**예 :**  

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
## 3. 스왑파일 등록
/etc/fstab을 수정하고 부팅할 때마다 스왑 파일을 로드하도록 설정하겠습니다.  

```bash
$ sudo vi /etc/fstab    
# add below in /etc/fstab
/swapfile              none            swap    sw              0       0
```
## 4. 재부팅
먼저 재부팅하세요. 재부팅 후 시스템 모니터에서 위에서 생성된 스왑 파일을 확인할 수 있습니다.  
![swapfile-ubuntu-system-monitor](/assets/images/230928213425/swapfile-ubuntu-system-monitor.png)  
