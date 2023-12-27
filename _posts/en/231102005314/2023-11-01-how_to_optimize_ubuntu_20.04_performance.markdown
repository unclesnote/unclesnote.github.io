---
title:  How to optimize Ubuntu 20.04 performance
image:
  path: /assets/images/231102005314/en-thumb-unclesnote-how_to_optimize_ubuntu_20.04_performance.png
  alt: How to optimize Ubuntu 20.04 performance
images: ["/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-application_menu_search_dock_appearance_settings.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-settings_appearance_resize_icon_size.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-warning_popup_for_low_disk_space_on_filessystem_root.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-ubuntu_software-bleachbit.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-bleachbit.png"]
categories: [Ubuntu, Common]
tags: [UbuntuAnimations, DockIconSize, swapfile, swap, Ubuntu, Common, BleachBit]
description:  Unless you are using a PC with Ubuntu OS installed as your main computer, you are likely to be using a PC with low hardware specifications or installing Ubuntu
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 00:53:14 +0900
ro_id: 231102005314
ro_name: how_to_optimize_ubuntu_20.04_performance
ro_ref: 231102005314/how_to_optimize_ubuntu_20.04_performance
lang: en
---
Unless you are using a PC with Ubuntu OS installed as your main computer, you are likely to be using a PC with low hardware specifications or installing Ubuntu on Oracle VM VirtualBox.  

If you mainly use SSH to connect remotely, it won't have much of an impact, but if you often manipulate the UI in GNOME, performance may be disappointing. So, here are some tips to optimize performance when installing and configuring Ubuntu.  
## Turn Off Animations
If you use Ubuntu on Virtual Box or a low-end PC, animations may slow down the performance of the OS due to limited resources. Below is how to turn animations off and on in the Ubuntu GNOME GUI. You can run commands in the terminal.  

Below is the terminal command to turn off Ubuntu animations and check the settings.  

```shell
$ gsettings set org.gnome.desktop.interface enable-animations false
$ gsettings get org.gnome.desktop.interface enable-animations
false
```
Below is the terminal command to turn on Ubuntu animations. The difference is that the last argument of the command is changed from `false` to `true`.  

```shell
$ gsettings set org.gnome.desktop.interface enable-animations true
$ gsettings get org.gnome.desktop.interface enable-animations
true
```
## Dock icon size
If you're using a limited-resolution display, the Dock's default icon size may be limiting for registering and navigating many icons at once. So, you can set the Dock icon size to be small.  

First, search for dock in `the Application menu` and open `Appearance` settings.  

![Dock Icon Size - Application Menu > Search `dock` > Appearance Settings](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-application_menu_search_dock_appearance_settings.png)
_Dock Icon Size - Application Menu > Search `dock` > Appearance Settings_

Then reduce `the Icon Size` and set it to a size that looks good to you.  

![Dock Icon Size - Settings > Appearance > Resize `Icon Size`](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-settings_appearance_resize_icon_size.png)
_Dock Icon Size - Settings > Appearance > Resize `Icon Size`_

## Increase swap size
If you are using Ubuntu installed in Virtual Box, it is likely that less than 8GB of memory is allocated to the virtual machine because it is shared with your Windows computer. This may not be a problem if you use Ubuntu casually, but when attempting to compile a large platform, BSP, or software, insufficient memory can lead to compilation failure. This can be solved by increasing the swap size.  

Since hard disk capacity is cheaper than memory capacity, let's increase swap. Please see the article below.  
- https://unclesnote.com/en/231102005313/how_to_increase_swapfile_size_in_ubuntu

## Secure free space on disk
If you are using Ubuntu with a virtual machine installed and the image size is not large enough, you may see a warning pop-up like the one below. This can occur if it accumulates in the system in temporary files or log files. If freespace converges to zero, your Ubuntu VM may not boot.  

![Warning Popup for Low Disk Space on Filessystem root](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-warning_popup_for_low_disk_space_on_filessystem_root.png)
_Warning Popup for Low Disk Space on Filessystem root_

Although you can delete temporary files or system log files manually, you can manage them more easily in a GUI environment by using the [BleachBit](https://www.bleachbit.org/features){:target="_blank"} application.  

You can easily install it by searching for `bleachbit` in the Ubuntu software application.  

![Ubuntu Software - BleachBit](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-ubuntu_software-bleachbit.png)
_Ubuntu Software - BleachBit_

After checking the items you want to organize, pressing the `Clean` button automatically deletes unnecessary files to secure free space. However, you must be careful when organizing the `APT` and `journald` items. This may break your Ubuntu system or package dependencies.  

![BleachBit](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-bleachbit.png)
_BleachBit_

