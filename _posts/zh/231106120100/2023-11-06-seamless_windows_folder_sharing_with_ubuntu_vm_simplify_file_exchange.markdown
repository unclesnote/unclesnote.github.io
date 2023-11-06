---
title:  在 VirtualBox 中设置 Ubuntu 共享文件夹 - Windows 文件共享
image:
  path: /assets/images/231106120100/zh-thumb-unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange.png
  alt: 在 VirtualBox 中设置 Ubuntu 共享文件夹 - Windows 文件共享
images: ["/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-oracle_vm_virtualbox-add_shared_folder.png", "/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-create_a_test.txt_file_using_the_touch_command_in_ubuntu_vm_and_check_it_in_windows.png"]
categories: [乌班图, 虚拟盒子]
tags: [虚拟盒子, vboxsf, 乌班图, 文件夹共享]
description:  就我而言，Oracle VM VirtualBox 中的 Ubuntu VM 和 Windows 之间存在频繁的文件共享。当然，您可以使用Guest Additions功能通过拖动鼠标来共享文件，但仍然有不方便的时候。因此，我想解释一下如何与 Ubuntu VM 共享 Windows 文件夹。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-06 12:01:00 +0900
ro_id: 231106120100
ro_name: seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange
ro_ref: 231106120100/seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange
lang: zh
---
就我而言，Oracle VM VirtualBox 中的 Ubuntu VM 和 Windows 之间存在频繁的文件共享。当然，您可以使用Guest Additions功能通过拖动鼠标来共享文件，但仍然有不方便的时候。  

因此，我想解释一下如何与 Ubuntu VM 共享 Windows 文件夹。  
## 在 Virtual Box 上添加共享文件夹
转到 Ubuntu VM 的设置。然后，在`共享文件夹`选项卡中添加要共享的文件夹。  

在共享文件夹设置窗口中，在`文件夹路径`中设置要与 Ubuntu 虚拟机共享的文件夹。其余文件夹及设置项目如下。  
- **文件夹路径**：与 Ubuntu VM 共享的`Windows`文件夹路径
- **文件夹名称**：这是共享文件夹的昵称。如果可能，请使其与`挂载点`的文件夹名称相同。
- **挂载点**：在`Ubuntu VM`上挂载共享文件夹的路径
- ☑ **自动挂载** : 开机时自动挂载共享文件夹
- ☑ **Make Permanent**：如果您在 Ubuntu VM 运行时输入当前设置，则会出现此项目。如果您想要永久设置，请选中它。

![Oracle VM VirtualBox - 添加共享文件夹](/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-oracle_vm_virtualbox-add_shared_folder.png)  

Oracle VM VirtualBox - 添加共享文件夹
{: style="color:gray; font-size: 80%; text-align: center;"}

就我而言，我将 `/home/pooh/_shared` 设置为 Ubuntu VM 中的共享文件夹。作为参考，我的 Ubuntu 帐户名称是`pooh`。  
## Ubuntu VM 上的文件夹权限
如果您在 Ubuntu VM 运行时添加了共享文件夹，请首先重新启动 Ubuntu VM。  

并且，当您尝试输入 `/home/pooh/_shared` 时，会显示一条错误消息，指示您没有权限。这是因为只有`vboxsf`组中的用户才能访问共享文件夹。  

```shell
$ ls -l /home/pooh
total 100
...
drwxrwx---  1 root vboxsf     0 11월  6 10:03 _shared
...

$ cd /home/pooh
bash: cd: /home/pooh: Permission denied

```
使用`gpasswd`命令将您的 Ubuntu 帐户添加到`vboxsf`组。作为参考，我的 Ubuntu 帐户的名称是`pooh`。因此，运行命令，将 `pooh` 替换为您的 Ubuntu 帐户名。  

```shell
sudo gpasswd -a pooh vboxsf
```
最重要的。最后，重新启动 Ubuntu 虚拟机。  
## 测试
Ubuntu VM 重启完成后，我们来进行测试。  

让我们在 Ubuntu VM 的共享文件夹中使用`touch`命令创建一个`test.txt`文件。您可以看到 Windows 共享文件夹中创建的`test.txt`文件吗？  
![在 Ubuntu VM 中使用 `touch` 命令创建一个 `test.txt` 文件，并在 Windows 中检查它。](/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-create_a_test.txt_file_using_the_touch_command_in_ubuntu_vm_and_check_it_in_windows.png)  

在 Ubuntu VM 中使用 `touch` 命令创建一个 `test.txt` 文件，并在 Windows 中检查它。
{: style="color:gray; font-size: 80%; text-align: center;"}

