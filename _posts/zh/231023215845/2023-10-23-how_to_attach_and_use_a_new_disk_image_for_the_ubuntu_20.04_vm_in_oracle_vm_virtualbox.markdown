---
title:  如何在 Oracle VM VirtualBox 中为 Ubuntu(20.04) VM 附加和使用新磁盘映像
image:
  path: /assets/images/231023215845/zh-thumb-attach_disk-create-virtual-box-disk-image.png
  alt: 如何在 Oracle VM VirtualBox 中为 Ubuntu(20.04) VM 附加和使用新磁盘映像
images: ["/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png", "/assets/images/231023215845/attach_disk-virtual-box-media-image.png", "/assets/images/231023215845/attach_disk-choose-disk.png", "/assets/images/231023215845/attach_disk-attached-disk-image.png", "/assets/images/231023215845/attach_disk-create-partition-table.png", "/assets/images/231023215845/attach_disk-create-partition.png", "/assets/images/231023215845/attach_disk-format-disk.png", "/assets/images/231023215845/attach_disk-disk-uuid.png"]
categories: [乌班图, 虚拟盒子]
tags: [乌班图, 虚拟盒子]
description:  我们将解释如何在 Oracle VM VirtualBox 的 Ubuntu(20.04) VM 中创建、附加和使用磁盘。该过程的大致轮廓如下。 #VirtualBox #GParted #fstab
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
- 在 Virtual Box Manager 中创建磁盘映像并将其附加到 Ubuntu VM
- 初始化并格式化Ubuntu GUI界面上附加的磁盘设备
- 使磁盘设备在每次 Ubuntu 启动时可用。

#VirtualBox #GParted #fstab  
## 1. 在 Virtual Box 中创建磁盘映像并将其附加到 Ubuntu VM
我打算添加55GB磁盘，方法是在`Virtual Media Manager`中提前创建一个全尺寸的图像文件。有多种方法可以根据使用的容量来增加图像容量，但我在某处看到，一旦图像文件大小增加，即使使用较少，它也不会再次减少。我们选择了一种更可靠的静态尺寸方法。  
![Attach Disk-create-virtual-box-disk-image](/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png)  
创建镜像一段时间后，您可以在列表中查看已创建的镜像。  
![Attach Disk-virtual-box-media-image](/assets/images/231023215845/attach_disk-virtual-box-media-image.png)  
进入要附加创建的磁盘映像的 Ubuntu VM 的设置。选择之前创建的硬盘进行添加。  
![Attach Disk-choose-disk](/assets/images/231023215845/attach_disk-choose-disk.png)  
可以看到磁盘镜像已添加到Ubuntu虚拟机中。您还可以在 VirtualBox Manager 中查看 Ubuntu 虚拟机信息。  
![Attach Disk-attached-disk-image](/assets/images/231023215845/attach_disk-attached-disk-image.png)  
## 2. 使用 GNOME GUI 中的 Gparted 工具初始化磁盘设备
在 Virtual Box 中运行 Ubuntu VM，我们将创建磁盘表和分区并继续格式化。  
当然，有控制台工具，例如`fdisk`，但为了方便起见，我们将使用 GNOME 的 GUI 分区工具`GParted`。  

```shell
# install gparted
sudo apt-get install gparted
# run gparted
gparted
```
选择连接的磁盘设备并应用`msdos`格式的分区表。  
![Attach Disk-create-partition-table](/assets/images/231023215845/attach_disk-create-partition-table.png)  
现在我们将创建一个分区。就我而言，我创建了一个完整大小的分区，如下所示。  
![Attach Disk-create-partition](/assets/images/231023215845/attach_disk-create-partition.png)  
将其格式化为`ext4`格式，然后单击绿色复选框以应用所有先前的设置。  
![Attach Disk-format-disk](/assets/images/231023215845/attach_disk-format-disk.png)  
检查分区信息中的`UUID`并复制。 UUID是设备的唯一ID。在下一节中，每次 Ubuntu 启动时都需要 UUID 来自动使磁盘可用。  
![Attach Disk-disk-uuid](/assets/images/231023215845/attach_disk-disk-uuid.png)  
## 3. 使磁盘在每次 Ubuntu 启动时可用
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
