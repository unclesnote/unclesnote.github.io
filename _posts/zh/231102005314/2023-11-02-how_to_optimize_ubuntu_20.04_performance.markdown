---
title:  如何优化 Ubuntu 20.04 性能
image:
  path: /assets/images/231102005314/zh-thumb-unclesnote-how_to_optimize_ubuntu_20.04_performance.png
  alt: 如何优化 Ubuntu 20.04 性能
images: ["/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-application_menu_search_dock_appearance_settings.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-settings_appearance_resize_icon_size.png"]
categories: [乌班图, 常见的]
tags: [Ubuntu动画, Dock图标大小, 交换文件, 交换, 乌班图, 常见的]
description:  除非您使用安装了 Ubuntu 操作系统的 PC 作为主计算机，否则您可能会使用硬件规格较低的 PC 或在 Oracle VM VirtualBox 上安装 Ubuntu。如果你主要使用 SSH 进行远程连接，那么不会有太大影响，但如果你经常操作 GNOME 中的 UI，性能可能会令人失望。因此，这里有一些在安装和配置 Ubuntu 时优化性能的技巧。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 00:53:14 +0900
ro_id: 231102005314
ro_name: how_to_optimize_ubuntu_20.04_performance
ro_ref: 231102005314/how_to_optimize_ubuntu_20.04_performance
lang: zh
---
除非您使用安装了 Ubuntu 操作系统的 PC 作为主计算机，否则您可能会使用硬件规格较低的 PC 或在 Oracle VM VirtualBox 上安装 Ubuntu。  

如果你主要使用 SSH 进行远程连接，那么不会有太大影响，但如果你经常操作 GNOME 中的 UI，性能可能会令人失望。因此，这里有一些在安装和配置 Ubuntu 时优化性能的技巧。  
## 关闭动画
如果您在 Virtual Box 或低端 PC 上使用 Ubuntu，由于资源有限，动画可能会降低操作系统的性能。以下是如何在 Ubuntu GNOME GUI 中关闭和打开动画。您可以在终端中运行命令。  

下面是关闭 Ubuntu 动画并检查设置的终端命令。  

```shell
$ gsettings set org.gnome.desktop.interface enable-animations false
$ gsettings get org.gnome.desktop.interface enable-animations
false
```
下面是打开 Ubuntu 动画的终端命令。不同之处在于命令的最后一个参数从`false`更改为`true`。  

```shell
$ gsettings set org.gnome.desktop.interface enable-animations true
$ gsettings get org.gnome.desktop.interface enable-animations
true
```
## Dock 图标大小
如果您使用的显示器分辨率有限，则 Dock 的默认图标大小可能会限制同时注册和导航多个图标。因此，您可以将 Dock 图标尺寸设置得较小。  

首先，在`应用程序菜单`中搜索dock并打开`外观`设置。  
![Dock 图标大小 - 应用程序菜单 > 搜索`dock` > 外观设置](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-application_menu_search_dock_appearance_settings.png)  

Dock 图标大小 - 应用程序菜单 > 搜索`dock` > 外观设置
{: style="color:gray; font-size: 80%; text-align: center;"}

然后减小`图标大小`并将其设置为适合您的大小。  
![Dock 图标大小 - 设置 > 外观 > 调整`图标大小`](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-settings_appearance_resize_icon_size.png)  

Dock 图标大小 - 设置 > 外观 > 调整`图标大小`
{: style="color:gray; font-size: 80%; text-align: center;"}

## 增加交换大小
如果您使用的是安装在 Virtual Box 中的 Ubuntu，则分配给虚拟机的内存可能会少于 8GB，因为它与您的 Windows 计算机共享。如果你随便使用Ubuntu，这可能不是问题，但当尝试编译大型平台、BSP或软件时，内存不足可能会导致编译失败。这可以通过增加交换大小来解决。  

由于硬盘容量比内存容量便宜，所以我们增加交换空间。请看下面的文章。  
