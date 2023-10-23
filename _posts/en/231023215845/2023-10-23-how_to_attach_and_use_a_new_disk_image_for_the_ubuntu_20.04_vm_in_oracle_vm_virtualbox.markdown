---
title:  How to attach and use a new disk image for the Ubuntu(20.04) VM in Oracle VM VirtualBox
image:
  path: /assets/images/231023215845/en-thumb-attach_disk-create-virtual-box-disk-image.png
  alt: How to attach and use a new disk image for the Ubuntu(20.04) VM in Oracle VM VirtualBox
images: ["/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png", "/assets/images/231023215845/attach_disk-virtual-box-media-image.png", "/assets/images/231023215845/attach_disk-choose-disk.png", "/assets/images/231023215845/attach_disk-attached-disk-image.png", "/assets/images/231023215845/attach_disk-create-partition-table.png", "/assets/images/231023215845/attach_disk-create-partition.png", "/assets/images/231023215845/attach_disk-format-disk.png", "/assets/images/231023215845/attach_disk-disk-uuid.png"]
categories: [Ubuntu, Virtual Box]
tags: [Ubuntu, VirtualBox]
description:  We will explain how to create, attach, and use disks in the Ubuntu(20.04) VM of Oracle VM VirtualBox. A rough outline of the procedure is as follows. #VirtualBox #GParted #fstab
public: true
toc: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-23 21:58:45 +0900
ro_id: 231023215845
ro_name: how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox
ro_ref: 231023215845/how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox
lang: en
---
We will explain how to create, attach, and use disks in the Ubuntu(20.04) VM of Oracle VM VirtualBox.  
A rough outline of the procedure is as follows.  
- Create a disk image in Virtual Box Manager and attach it to the Ubuntu VM
- Initialize and format disk devices attached on the Ubuntu GUI interface
- Make the disk device available every time Ubuntu boots up.

#VirtualBox #GParted #fstab  
## 1. Create a disk image in Virtual Box and attach it to the Ubuntu VM
I am planning to add 55GB of disk, and the method is to create a full-size image file in advance in `Virtual Media Manager`. There are ways to increase the image capacity variably depending on the capacity used, but I have seen somewhere that once the image file size has increased, it does not decrease again even if you use less. We chose a more reliable method with a static size.  
![Attach Disk-create-virtual-box-disk-image](/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png)  
After some time has passed for image creation, you can check the created image in the list.  
![Attach Disk-virtual-box-media-image](/assets/images/231023215845/attach_disk-virtual-box-media-image.png)  
Go into the settings of the Ubuntu VM to which you want to attach the created disk image. Select the previously created hard disk to add.  
![Attach Disk-choose-disk](/assets/images/231023215845/attach_disk-choose-disk.png)  
You can see that the disk image has been added to the Ubuntu VM. You can also check the Ubuntu VM information in VirtualBox Manager.  
![Attach Disk-attached-disk-image](/assets/images/231023215845/attach_disk-attached-disk-image.png)  
## 2. Initialize disk devices using the Gparted tool in the GNOME GUI
Run the Ubuntu VM in Virtual Box  and We will create disk tables and partitions and proceed with formatting.  
Of course, there are console tools such as `fdisk` for this, but for convenience, we will use GNOME's GUI partition tool, `GParted`.  

```shell
# install gparted
sudo apt-get install gparted
# run gparted
gparted
```
Select the attached disk device and apply the partition table in `msdos` format.  
![Attach Disk-create-partition-table](/assets/images/231023215845/attach_disk-create-partition-table.png)  
Now we will create a partition. In my case, I created a partition with the full size as shown below.  
![Attach Disk-create-partition](/assets/images/231023215845/attach_disk-create-partition.png)  
Format it in `ext4` format and click the green checkbox to apply all previous settings.  
![Attach Disk-format-disk](/assets/images/231023215845/attach_disk-format-disk.png)  
Check `UUID` in the partition information and copy it. UUID is the unique ID of the device. The UUID is needed to automatically make the disk available every time Ubuntu boots in the next section.  
![Attach Disk-disk-uuid](/assets/images/231023215845/attach_disk-disk-uuid.png)  
## 3. Make disk available on every Ubuntu boot-up
In the current state, the formatted disk device is ready, but there is no path through which files can be written. So, we will create a path by connecting my specific folder to the hard disk device. This is `mount`.  
The `UUID` identified in gparted above represents the hard disk device, and we will connect this device to the `/mnt/data` folder to create a path through which files can be written. Since the disk needs to be available every time Ubuntu boots up, we will describe this in `/etc/fstab`.  
The line below will be added to `/etc/fstab`.  

```bash
# UUID=<hard disk device UUID> <folder where the device will be mounted> ext4    defaults          0       0 
UUID=e47277b0-04dd-44f1-a4c0-861654b4d226 /mnt/data       ext4    defaults          0       0 
```
Then, we will create a symbolic link from the mounted `/mnt/data` to the `data` folder in the home directory.  
The detailed procedure is as follows, and if you have completed all steps, reboot.  

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
