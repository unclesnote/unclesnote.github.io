---
title:  Setting up Ubuntu shared folder in VirtualBox- Windows File Sharing
image:
  path: /assets/images/231106120100/en-thumb-unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange.png
  alt: Setting up Ubuntu shared folder in VirtualBox- Windows File Sharing
images: ["/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-oracle_vm_virtualbox-add_shared_folder.png", "/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-create_a_test.txt_file_using_the_touch_command_in_ubuntu_vm_and_check_it_in_windows.png"]
categories: [Ubuntu, Virtual Box]
tags: [VirtualBox, vboxsf, Ubuntu, FolderSharing]
description:  In my case, there is frequent file sharing between Ubuntu VM and Windows in Oracle VM VirtualBox. Of course, you can use the Guest Additions feature to share
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-06 12:01:00 +0900
ro_id: 231106120100
ro_name: seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange
ro_ref: 231106120100/seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange
lang: en
---
In my case, there is frequent file sharing between Ubuntu VM and Windows in Oracle VM VirtualBox. Of course, you can use the Guest Additions feature to share files by dragging the mouse, but there are still times when it is inconvenient.  

So, I would like to explain how to share a Windows folder with an Ubuntu VM.  
## Adding Shared Folder on Virtual Box
Go to the settings of your Ubuntu VM. Then, add the folder to be shared in the `Shared Folders` tab.  

In the shared folder settings window, set the folder you want to share with the Ubuntu VM in `Folder Path`. The remaining folders and setting items are as follows.  
- **Folder Path** : `Windows` folder path to be shared with Ubuntu VM
- **Folder Name** : This is the shared folder nickname. If possible, make it the same as the folder name of `Mount point`.
- **Mount point** : Path to mount the shared folder on your `Ubuntu VM`
- ☑ **Auto-mount** : Automatically mount shared folders when booting up
- ☑ **Make Permanent** : This item appears if you enter the current settings while the Ubuntu VM is running. If you want a permanent setting, check it.

![Oracle VM VirtualBox - Add shared folder](/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-oracle_vm_virtualbox-add_shared_folder.png)  

Oracle VM VirtualBox - Add shared folder
{: style="color:gray; font-size: 80%; text-align: center;"}

In my case, I set `/home/pooh/_shared` as a shared folder in the Ubuntu VM.  For reference, my Ubuntu account name is `pooh`.  
## Folder permissions on Ubuntu VM
If you added a shared folder while the Ubuntu VM is running, first reboot the Ubuntu VM.  

And, when you try to enter `/home/pooh/_shared`, an error message indicating that you do not have permission will be displayed. This is because only users included in the `vboxsf` group can access the shared folder.  

```shell
$ ls -l /home/pooh
total 100
...
drwxrwx---  1 root vboxsf     0 11월  6 10:03 _shared
...

$ cd /home/pooh
bash: cd: /home/pooh: Permission denied

```
Use the `gpasswd` command to add your Ubuntu account to the `vboxsf` group. For reference, the name of my Ubuntu account is `pooh`. So run the command, replacing `pooh` with your Ubuntu account name.  

```shell
sudo gpasswd -a pooh vboxsf
```
Most important. Lastly, reboot the Ubuntu VM.  
## Testing
Once the reboot of the Ubuntu VM is complete, let's perform a test.  

Let's create a `test.txt` file using the `touch` command in shared folder of the Ubuntu VM. Can you see the `test.txt` file created in the Windows shared folder?  
![Create a `test.txt` file using the `touch` command in Ubuntu VM and check it in Windows.](/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-create_a_test.txt_file_using_the_touch_command_in_ubuntu_vm_and_check_it_in_windows.png)  

Create a `test.txt` file using the `touch` command in Ubuntu VM and check it in Windows.
{: style="color:gray; font-size: 80%; text-align: center;"}

