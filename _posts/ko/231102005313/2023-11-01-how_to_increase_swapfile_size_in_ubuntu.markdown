---
title:  Ubuntu에서 스왑 파일 크기를 늘리는 방법
image:
  path: /assets/images/231102005313/ko-thumb-unclesnote-how_to_increase_swapfile_size_in_ubuntu.png
  alt: Ubuntu에서 스왑 파일 크기를 늘리는 방법
images: ["/assets/images/231102005313/unclesnote-how_to_increase_swapfile_size_in_ubuntu-applications_menu_system_monitor.png"]
categories: [우분투, 일반]
tags: [파탭, 스왑, 스왑파일, 우분투, 일반]
description:  때로는 충분한 물리적 메모리 없이 Ubuntu 시스템을 오랫동안 실행한 상태로 두거나 대규모 플랫폼이나 BSP를 컴파일하고 구축하는 경우 성능이 저하되거나 오류가 발생할 수 있습니다. 따라서 Linux 기반 OS에서는 물리적 메모리가 부족할 경우 스왑 파일을 생성하여 하드디스크에 있는
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 00:53:13 +0900
ro_id: 231102005313
ro_name: how_to_increase_swapfile_size_in_ubuntu
ro_ref: 231102005313/how_to_increase_swapfile_size_in_ubuntu
lang: ko
---
때로는 충분한 물리적 메모리 없이 Ubuntu 시스템을 오랫동안 실행한 상태로 두거나 대규모 플랫폼이나 BSP를 컴파일하고 구축하는 경우 성능이 저하되거나 오류가 발생할 수 있습니다.  

따라서 Linux 기반 OS에서는 물리적 메모리가 부족할 경우 스왑 파일을 생성하여 하드디스크에 있는 파일을 메모리로 사용합니다. 이를 스왑 파일이라고 하며, Windows 환경의 가상 메모리와 유사합니다.  

이제 Ubuntu 20.04에서 스왑파일을 생성하고 적용하는 방법을 설명하겠습니다.  
## 스왑 확인
내 Ubuntu 환경에서 스왑 상태를 확인하려면 `free -m` 명령을 사용하세요. 그리고 `root` 시스템에 `swapfile`이 있는지 확인하세요. 루트 경로에 스왑 파일을 생성하는 것이 일반적입니다.  

제 경우에는 2GB의 스왑을 사용하고 있으며 스왑 파일은 루트 경로에 있습니다.  

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
## 스왑 파일 생성
기존 2GB 스왑파일을 삭제하고 5GB 스왑파일을 새로 생성하겠습니다.  

먼저 스왑 기능을 끄고 이미 사용 중인 2GB 스왑 파일을 삭제합니다.  

```shell
sudo swapoff -v /swapfile
sudo rm /swapfile
```
그런 다음 루트에 5GB 스왑 파일을 생성하고 파일 권한을 600에 할당합니다.  

```shell
sudo fallocate -l 5G /swapfile
sudo chmod 600 /swapfile 
```
마지막으로 새로 생성된 파일로 스왑을 활성화합니다.  

```bash
sudo mkswap /swapfile
sudo swapon /swapfile
```
아래는 위의 명령을 실행한 방법입니다.  

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
## 스왑파일 등록
이제 마지막으로 부팅할 때마다 스왑 파일을 로드하도록 Ubuntu를 구성하겠습니다.  

그런 다음 `/etc/fstab`을 엽니다.  

```shell
sudo vi /etc/fstab    
```
그리고 아래 줄을 추가하세요. 이미 설정되어 있으면 추가할 필요가 없습니다.  

```shell
/swapfile              none            swap    sw              0       0
```
## 재부팅
먼저 재부팅하세요. 재부팅 후 시스템 모니터에서 위에서 생성된 스왑 파일을 확인할 수 있습니다.  
![`응용 프로그램` 메뉴 > 시스템 모니터](/assets/images/231102005313/unclesnote-how_to_increase_swapfile_size_in_ubuntu-applications_menu_system_monitor.png)
_`응용 프로그램` 메뉴 > 시스템 모니터_

