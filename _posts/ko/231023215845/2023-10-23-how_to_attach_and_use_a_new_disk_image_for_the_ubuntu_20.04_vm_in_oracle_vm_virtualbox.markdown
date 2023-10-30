---
title:  Oracle VM VirtualBox에서 Ubuntu(20.04) VM용 새 하드 디스크를 연결하고 사용하는 방법
image:
  path: /assets/images/231023215845/ko-thumb-attach_disk-create-virtual-box-disk-image.png
  alt: Oracle VM VirtualBox에서 Ubuntu(20.04) VM용 새 하드 디스크를 연결하고 사용하는 방법
images: ["/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png", "/assets/images/231023215845/attach_disk-virtual-box-media-image.png", "/assets/images/231023215845/attach_disk-choose-disk.png", "/assets/images/231023215845/attach_disk-attached-disk-image.png", "/assets/images/231023215845/attach_disk-create-partition-table.png", "/assets/images/231023215845/attach_disk-create-partition.png", "/assets/images/231023215845/attach_disk-format-disk.png", "/assets/images/231023215845/attach_disk-disk-uuid.png"]
categories: [우분투, 가상박스]
tags: [우분투, 버추얼박스, GParted, fstab, UUID]
description:  Oracle VM VirtualBox의 Ubuntu(20.04) VM에서 디스크를 생성, 연결, 사용하는 방법을 설명하겠습니다. 대략적인 절차는 다음과 같습니다.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-23 21:58:45 +0900
ro_id: 231023215845
ro_name: how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox
ro_ref: 231023215845/how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox
lang: ko
---
Oracle VM VirtualBox의 Ubuntu(20.04) VM에서 디스크를 생성, 연결, 사용하는 방법을 설명하겠습니다.  
대략적인 절차는 다음과 같습니다.  
- Virtual Box Manager에서 가상 하드 디스크를 생성하고 Ubuntu VM에 연결합니다.
- Ubuntu GUI 인터페이스에 연결된 디스크 장치 초기화 및 포맷
- Ubuntu가 부팅될 때마다 디스크 장치를 사용할 수 있게 만드세요.

## 1. 디스크 이미지를 생성하여 Ubuntu VM에 연결
디스크 이미지는 Virtual Box 관리자의 `Virtual Media Manager`를 통해 생성할 수 있습니다.  
55GB의 이미지를 생성할 예정인데, 디스크 이미지를 생성하는 방법은 2가지가 있습니다. 첫 번째는 내가 사용한 만큼 내 하드디스크의 용량을 점유하는 옵션이고, 두 번째는 처음부터 계획한 용량을 한꺼번에 점유하는 옵션을 생성하는 것이다. 하지만 안정적인 운영을 위해 두 번째 옵션으로 한번에 55GB를 생성하겠습니다.  
`전체 크기 사전 할당` 옵션을 사용하여 가상 하드 디스크를 만들었습니다.  
![ Oracle VM VirtualBox Manager - 가상 하드 디스크 생성](/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png)  

Oracle VM VirtualBox Manager - 가상 하드 디스크 생성
{: style="color:gray; font-size: 80%; text-align: center;"}

가상 디스크 이미지 생성이 완료되면 가상 디스크 이미지 초기화 시간이 지난 후 생성된 디스크를 하드디스크 목록에서 확인할 수 있습니다.  
![Oracle VM VirtualBox Manager - 가상 하드 디스크 초기화 진행 중](/assets/images/231023215845/attach_disk-virtual-box-media-image.png)  

Oracle VM VirtualBox Manager - 가상 하드 디스크 초기화 진행 중
{: style="color:gray; font-size: 80%; text-align: center;"}

이제 생성된 가상 하드 디스크를 Ubuntu VM에 추가하겠습니다.  
Ubuntu VM 설정의 `저장` 탭에서 SATA 컨트롤러를 사용하여 하드 디스크를 추가할 수 있습니다.  
![Oracle VM VirtualBox Manager - Ubuntu VM에 하드 디스크 추가](/assets/images/231023215845/attach_disk-choose-disk.png)  

Oracle VM VirtualBox Manager - Ubuntu VM에 하드 디스크 추가
{: style="color:gray; font-size: 80%; text-align: center;"}

생성한 하드디스크를 선택하면 정보창에서 해당 하드디스크가 장착된 것을 확인할 수 있습니다.  
![Oracle VM VirtualBox Manager - Ubuntu VM에 추가된 하드 디스크 확인](/assets/images/231023215845/attach_disk-attached-disk-image.png)  

Oracle VM VirtualBox Manager - Ubuntu VM에 추가된 하드 디스크 확인
{: style="color:gray; font-size: 80%; text-align: center;"}

## 2. Ubuntu VM에서 디스크 초기화
가상 머신 관점에서 하드 디스크는 Ubuntu VM에 물리적으로 연결됩니다.  
이제 Ubuntu VM에서 디스크를 포맷하겠습니다. 이 작업은 기존 `fdisk`를 사용하여 수행할 수 있지만 `Gparted`라는 보다 직관적인 GUI 도구를 사용하여 진행하겠습니다.  
apt를 사용하여 gparted를 설치하고 실행해 보겠습니다.  

```shell
# install gparted
sudo apt-get install gparted
# run gparted
gparted
```
GParted 오른쪽 상단에 생성된 하드디스크를 선택한 후, 아래 그림과 같이 `msdos` 파티션 테이블을 생성하고 `ext4`로 포맷하겠습니다.  
메뉴를 통해 파티션 `msdos` 파티션 테이블을 적용합니다.  
![Ubuntu VM - GParted - msdos 형식으로 파티션 테이블 생성](/assets/images/231023215845/attach_disk-create-partition-table.png)  

Ubuntu VM - GParted - msdos 형식으로 파티션 테이블 생성
{: style="color:gray; font-size: 80%; text-align: center;"}

그런 다음 파티션을 생성하겠습니다. 할당되지 않은 파티션을 마우스 오른쪽 버튼으로 클릭하고 `ext4` 파일 시스템 파티션을 만듭니다. 저는 풀사이즈로 설정했어요.  
![Ubuntu VM - GParted - ext4 파일 시스템으로 파티션 생성](/assets/images/231023215845/attach_disk-create-partition.png)  

Ubuntu VM - GParted - ext4 파일 시스템으로 파티션 생성
{: style="color:gray; font-size: 80%; text-align: center;"}

ext4 파일 시스템의 파티션을 `etx4`로 포맷합니다.  
그런 다음 녹색 확인란을 클릭하여 지금까지 설정한 내용을 적용합니다.  
![Ubuntu VM - GParted - 파티션을 ext4로 포맷](/assets/images/231023215845/attach_disk-format-disk.png)  

Ubuntu VM - GParted - 파티션을 ext4로 포맷
{: style="color:gray; font-size: 80%; text-align: center;"}

이제 하드 디스크 초기화가 완료되었습니다. Ubuntu VM이 부팅될 때마다 사용할 수 있도록 하드 디스크를 마운트하려면 고유한 디스크 ID 정보가 필요합니다. 생성된 파티션을 마우스 오른쪽 버튼으로 클릭하고 정보 메뉴에서 `UUID`를 확인하고 기억해 두세요.  
![Ubuntu VM - GParted - 디스크 파티션의 UUID 확인](/assets/images/231023215845/attach_disk-disk-uuid.png)  

Ubuntu VM - GParted - 디스크 파티션의 UUID 확인
{: style="color:gray; font-size: 80%; text-align: center;"}

## 3. 부팅할 때마다 디스크를 마운트합니다.
현재 상태에서는 포맷된 디스크 장치가 준비되어 있으나 파일을 쓸 수 있는 경로가 없습니다. 그래서 나의 특정 폴더를 하드디스크 장치에 연결하여 경로를 생성하겠습니다. `마운트` 입니다.  
위의 gparted에서 확인된 `UUID`는 하드디스크 장치를 나타내며, 이 장치를 `/mnt/data` 폴더에 연결하여 파일을 쓸 수 있는 경로를 생성하겠습니다. Ubuntu가 부팅될 때마다 디스크를 사용할 수 있어야 하므로 `/etc/fstab`에서 이에 대해 설명하겠습니다.  
아래 줄은 `/etc/fstab`에 추가됩니다.  

```bash
# UUID=<hard disk device UUID> <folder where the device will be mounted> ext4    defaults          0       0 
UUID=e47277b0-04dd-44f1-a4c0-861654b4d226 /mnt/data       ext4    defaults          0       0 
```
그런 다음 마운트된 `/mnt/data`에서 홈 디렉토리의 `data` 폴더로의 심볼릭 링크를 생성합니다.  
자세한 절차는 다음과 같으며, 모든 단계를 완료하셨다면 재부팅을 해주시기 바랍니다.  

```shell
$ mkdir -p /mnt/data
$ sudo chown -R ${USER}:users /mnt/data
$ cd ~/
$ sudo ln -s /mnt/data data
$ sudo vi /etc/fstab  
#-----------------------------------------------------------------------------
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda5 during installation
UUID=76a80216-1031-4871-945c-4c8de2845136 /               ext4    errors=remount-ro 0       1
UUID=e47277b0-04dd-44f1-a4c0-861654b4d226 /mnt/data       ext4    defaults          0       0 
# /boot/efi was on /dev/sda1 during installation
UUID=A4B5-D201  /boot/efi       vfat    umask=0077      0       1
/swapfile                                 none            swap    sw              0       0
```
