---
title:  Oracle VM VirtualBox에서 Ubuntu(20.04) VM에 대한 새 디스크 이미지를 연결하고 사용하는 방법
image:
  path: /assets/images/231023215845/ko-thumb-attach_disk-create-virtual-box-disk-image.png
  alt: Oracle VM VirtualBox에서 Ubuntu(20.04) VM에 대한 새 디스크 이미지를 연결하고 사용하는 방법
images: ["/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png", "/assets/images/231023215845/attach_disk-virtual-box-media-image.png", "/assets/images/231023215845/attach_disk-choose-disk.png", "/assets/images/231023215845/attach_disk-attached-disk-image.png", "/assets/images/231023215845/attach_disk-create-partition-table.png", "/assets/images/231023215845/attach_disk-create-partition.png", "/assets/images/231023215845/attach_disk-format-disk.png", "/assets/images/231023215845/attach_disk-disk-uuid.png"]
categories: [우분투, 가상박스]
tags: [우분투, 버추얼박스]
description:  Oracle VM VirtualBox의 Ubuntu(20.04) VM에서 디스크를 생성, 연결, 사용하는 방법을 설명하겠습니다. 대략적인 절차는 다음과 같습니다. #가상박스 #GParted #fstab
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
- Virtual Box Manager에서 디스크 이미지를 생성하고 Ubuntu VM에 연결합니다.
- Ubuntu GUI 인터페이스에 연결된 디스크 장치 초기화 및 포맷
- Ubuntu가 부팅될 때마다 디스크 장치를 사용할 수 있게 만드세요.

#가상박스 #GParted #fstab  
## 1. Virtual Box에서 디스크 이미지를 생성하고 Ubuntu VM에 연결합니다.
55GB의 디스크를 추가할 예정인데, `Virtual Media Manager`에서 미리 풀 사이즈 이미지 파일을 만들어 두는 방법이 있습니다. 사용하는 용량에 따라 이미지 용량을 가변적으로 늘리는 방법이 있는데, 한번 이미지 파일 크기를 늘리면 적게 사용해도 다시 줄어들지 않는 경우를 본 적이 있습니다. 우리는 정적 크기를 사용하는 보다 안정적인 방법을 선택했습니다.  
![Attach Disk-create-virtual-box-disk-image](/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png)  
이미지 생성을 위해 일정 시간이 지난 후 생성된 이미지를 목록에서 확인할 수 있습니다.  
![Attach Disk-virtual-box-media-image](/assets/images/231023215845/attach_disk-virtual-box-media-image.png)  
생성된 디스크 이미지를 연결하려는 Ubuntu VM의 설정으로 이동합니다. 이전에 생성한 하드디스크를 선택하여 추가하세요.  
![Attach Disk-choose-disk](/assets/images/231023215845/attach_disk-choose-disk.png)  
Ubuntu VM에 디스크 이미지가 추가된 것을 확인할 수 있습니다. VirtualBox Manager에서 Ubuntu VM 정보를 확인할 수도 있습니다.  
![Attach Disk-attached-disk-image](/assets/images/231023215845/attach_disk-attached-disk-image.png)  
## 2. GNOME GUI에서 Gparted 도구를 사용하여 디스크 장치 초기화
Virtual Box에서 Ubuntu VM을 실행하면 디스크 테이블과 파티션을 생성하고 포맷을 진행하겠습니다.  
물론 이를 위한 `fdisk`와 같은 콘솔 도구도 있지만 편의상 GNOME의 GUI 파티션 도구인 `GParted`를 사용하겠습니다.  

```shell
# install gparted
sudo apt-get install gparted
# run gparted
gparted
```
연결된 디스크 장치를 선택하고 `msdos` 형식으로 파티션 테이블을 적용합니다.  
![Attach Disk-create-partition-table](/assets/images/231023215845/attach_disk-create-partition-table.png)  
이제 파티션을 생성하겠습니다. 제 경우에는 아래와 같이 전체 크기의 파티션을 생성했습니다.  
![Attach Disk-create-partition](/assets/images/231023215845/attach_disk-create-partition.png)  
`ext4` 형식으로 포맷하고 녹색 확인란을 클릭하여 이전 설정을 모두 적용합니다.  
![Attach Disk-format-disk](/assets/images/231023215845/attach_disk-format-disk.png)  
파티션 정보에서 `UUID`를 확인하고 복사하세요. UUID는 장치의 고유 ID입니다. UUID는 다음 섹션에서 Ubuntu가 부팅될 때마다 디스크를 자동으로 사용 가능하게 만드는 데 필요합니다.  
![Attach Disk-disk-uuid](/assets/images/231023215845/attach_disk-disk-uuid.png)  
## 3. 모든 Ubuntu 부팅 시 디스크를 사용할 수 있도록 설정
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
