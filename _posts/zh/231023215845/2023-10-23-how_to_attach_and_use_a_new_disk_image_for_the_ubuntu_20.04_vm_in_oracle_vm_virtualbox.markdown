---
title:  如何在 Oracle VM VirtualBox 中为 Ubuntu(20.04) VM 附加和使用新磁盘映像
image:
  path: /assets/images/231023215845/zh-thumb-attach_disk-create-virtual-box-disk-image.png
  alt: 如何在 Oracle VM VirtualBox 中为 Ubuntu(20.04) VM 附加和使用新磁盘映像
images: ["/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png", "/assets/images/231023215845/attach_disk-virtual-box-media-image.png", "/assets/images/231023215845/attach_disk-choose-disk.png", "/assets/images/231023215845/attach_disk-attached-disk-image.png", "/assets/images/231023215845/attach_disk-create-partition-table.png", "/assets/images/231023215845/attach_disk-create-partition.png", "/assets/images/231023215845/attach_disk-format-disk.png", "/assets/images/231023215845/attach_disk-disk-uuid.png"]
categories: [乌班图, 虚拟盒子]
tags: [乌班图, 虚拟盒子, 格帕特, 系统表, 通用唯一标识符]
description:  我们将解释如何在 Oracle VM VirtualBox 的 Ubuntu(20.04) VM 中创建、附加和使用磁盘。该过程的大致轮廓如下。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-23 21:58:45 +0900
ro_id: 231023215845
ro_name: how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox
ro_ref: 231023215845/how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox
lang: zh
---
我们将解释如何在 Oracle VM VirtualBox 的 Ubuntu(20.04) VM 中创建、附加和使用磁盘。  
该过程的大致轮廓如下。  
- 在 Virtual Box Manager 中创建虚拟硬盘并将其附加到 Ubuntu VM
- 初始化并格式化Ubuntu GUI界面上附加的磁盘设备
- 使磁盘设备在每次 Ubuntu 启动时可用。

## 1. 创建磁盘映像并将其附加到 Ubuntu VM
可以通过 Virtual Box 管理器中的`虚拟媒体管理器`创建磁盘映像。  
我计划创建一个55GB的镜像，创建磁盘镜像有两种选择。第一个是一个选项，占用我已经使用的硬盘容量，第二个是创建一个选项，一次性占用从一开始就计划的容量。不过，为了稳定运行，我会使用第二个选项一次创建55GB。  
我使用`预分配完整大小`选项创建了一个虚拟硬盘。  
![ Oracle VM VirtualBox Manager - 创建虚拟硬盘](/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png)  

Oracle VM VirtualBox Manager - 创建虚拟硬盘
{: style="color:gray; font-size: 80%; text-align: center;"}

创建虚拟磁盘映像后，经过虚拟磁盘映像初始化时间后，您可以在硬盘列表中查看创建的磁盘。  
![Oracle VM VirtualBox Manager - 正在进行虚拟硬盘初始化](/assets/images/231023215845/attach_disk-virtual-box-media-image.png)  

Oracle VM VirtualBox Manager - 正在进行虚拟硬盘初始化
{: style="color:gray; font-size: 80%; text-align: center;"}

现在我们将创建的虚拟硬盘添加到Ubuntu VM中。  
您可以在 Ubuntu VM 设置的`存储`选项卡中使用 SATA 控制器添加硬盘。  
![Oracle VM VirtualBox Manager - 将硬盘添加到 Ubuntu VM](/assets/images/231023215845/attach_disk-choose-disk.png)  

Oracle VM VirtualBox Manager - 将硬盘添加到 Ubuntu VM
{: style="color:gray; font-size: 80%; text-align: center;"}

当您选择您创建的硬盘时，您可以在信息部分检查该硬盘是否已连接。  
![Oracle VM VirtualBox Manager - 检查添加到 Ubuntu VM 的硬盘](/assets/images/231023215845/attach_disk-attached-disk-image.png)  

Oracle VM VirtualBox Manager - 检查添加到 Ubuntu VM 的硬盘
{: style="color:gray; font-size: 80%; text-align: center;"}

## 2. Ubuntu VM 中的磁盘初始化
从虚拟机的角度来看，硬盘物理连接到 Ubuntu VM。  
现在我们要在 Ubuntu VM 中格式化磁盘。我们可以使用经典的`fdisk`来完成此操作，但我们将继续使用一个更直观的 GUI 工具，称为`Gparted`。  
让我们使用 apt 安装并运行 gparted。  

```shell
# install gparted
sudo apt-get install gparted
# run gparted
gparted
```
选择GParted右上角创建的硬盘后，我们将创建一个`msdos`分区表，并按照下图将其格式化为`ext4`。  
通过菜单应用分区`msdos`分区表。  
![Ubuntu VM - GParted - 以 msdos 格式创建分区表](/assets/images/231023215845/attach_disk-create-partition-table.png)  

Ubuntu VM - GParted - 以 msdos 格式创建分区表
{: style="color:gray; font-size: 80%; text-align: center;"}

然后，我们将创建一个分区。右键单击未分配的分区并创建一个`ext4`文件系统分区。我把它设置为全尺寸。  
![Ubuntu VM - GParted - 使用 ext4 文件系统创建分区](/assets/images/231023215845/attach_disk-create-partition.png)  

Ubuntu VM - GParted - 使用 ext4 文件系统创建分区
{: style="color:gray; font-size: 80%; text-align: center;"}

将 ext4 文件系统的分区格式化为`etx4`。  
然后单击绿色复选框以应用到目前为止所做的设置。  
![Ubuntu VM - GParted - 将分区格式化为 ext4](/assets/images/231023215845/attach_disk-format-disk.png)  

Ubuntu VM - GParted - 将分区格式化为 ext4
{: style="color:gray; font-size: 80%; text-align: center;"}

至此硬盘初始化完成。要挂载硬盘以便每次 Ubuntu VM 启动时都可以使用它，需要唯一的磁盘 ID 信息。右键单击创建的分区，在信息菜单中查看`UUID`，并记住它。  
![Ubuntu VM - GParted - 检查磁盘分区的 UUID](/assets/images/231023215845/attach_disk-disk-uuid.png)  

Ubuntu VM - GParted - 检查磁盘分区的 UUID
{: style="color:gray; font-size: 80%; text-align: center;"}

## 3.每次启动，挂载磁盘
当前状态下，格式化的磁盘设备已就绪，但没有可写入文件的路径。因此，我们将通过将我的特定文件夹连接到硬盘设备来创建一条路径。这是`挂载`。  
上面gparted中标识的`UUID`代表硬盘设备，我们将这个设备连接到`/mnt/data`文件夹，创建一个可以写入文件的路径。由于每次 Ubuntu 启动时磁盘都需要可用，因此我们将在`/etc/fstab`中对此进行描述。  
下面的行将添加到 `/etc/fstab` 中。  

```bash
# UUID=<hard disk device UUID> <folder where the device will be mounted> ext4    defaults          0       0 
UUID=e47277b0-04dd-44f1-a4c0-861654b4d226 /mnt/data       ext4    defaults          0       0 
```
然后，我们将创建一个从挂载的`/mnt/data`到主目录中`data`文件夹的符号链接。  
详细过程如下，如果完成所有步骤，请重新启动。  

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
