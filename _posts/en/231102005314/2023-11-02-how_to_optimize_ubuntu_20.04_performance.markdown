---
title:  How to optimize Ubuntu 20.04 performance
image:
  path: /assets/images/231102005314/en-thumb-ubuntu_optimization-ubuntu-appearance.png
  alt: How to optimize Ubuntu 20.04 performance
images: ["/assets/images/231102005314/ubuntu_optimization-ubuntu-appearance.png", "/assets/images/231102005314/ubuntu_optimization-ubuntu-settings-appearance-icon-size.png"]
categories: [Ubuntu, Common]
tags: [UbuntuAnimations, DockIconSize, swapfile, swap, Ubuntu, Common]
description:  Unless you are using a PC with Ubuntu OS installed as your main computer, you are likely to be using a PC with low hardware specifications or installing Ubuntu on Oracle VM VirtualBox. If you mainly use SSH to connect remotely, it won't have much of an impact, but if you often manipulate the UI in GNOME, performance may be disappointing. So, here are some tips to optimize performance when installing and configuring Ubuntu.
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
![Dock Icon Size - Application Menu > Search `dock` > Appearance Settings](/assets/images/231102005314/ubuntu_optimization-ubuntu-appearance.png)  

Dock Icon Size - Application Menu > Search `dock` > Appearance Settings
{: style="color:gray; font-size: 80%; text-align: center;"}

Then reduce `the Icon Size` and set it to a size that looks good to you.  
![Dock Icon Size - Settings > Appearance > Resize `Icon Size`](/assets/images/231102005314/ubuntu_optimization-ubuntu-settings-appearance-icon-size.png)  

Dock Icon Size - Settings > Appearance > Resize `Icon Size`
{: style="color:gray; font-size: 80%; text-align: center;"}

## Increase swap size
If you are using Ubuntu installed in Virtual Box, it is likely that less than 8GB of memory is allocated to the virtual machine because it is shared with your Windows computer. This may not be a problem if you use Ubuntu casually, but when attempting to compile a large platform, BSP, or software, insufficient memory can lead to compilation failure. This can be solved by increasing the swap size.  
Since hard disk capacity is cheaper than memory capacity, let's increase swap. Please see the article below.  
