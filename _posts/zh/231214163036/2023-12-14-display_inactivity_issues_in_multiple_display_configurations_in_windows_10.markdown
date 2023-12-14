---
title:  Windows 10 中多个显示配置中的显示不活动问题
image:
  path: /assets/images/231214163036/zh-thumb-unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10.png
  alt: Windows 10 中多个显示配置中的显示不活动问题
images: ["/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-windows_+_r_enter_regedit.png", "/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-registry_editor-remove_the_configuration_and_connectivity_folders_in_the_graphicsdrivers_folder.png"]
categories: [电脑, 故障排除]
tags: [电脑, 故障排除]
description:  我是一名随身携带笔记本电脑并且有时在家工作的用户。我在工作和家里使用连接到笔记本电脑的两个或多个显示器，但有时笔记本电脑只能识别某些显示器，并且当我进入显示设置时显示为非活动状态。我的猜测是Windows通过将其以预设的形式存储在注册表中来管理适合每个环境的显示配置，但似乎这个问题有时是由于此配置的扭曲引起的。我发现
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-14 16:30:36 +0900
ro_id: 231214163036
ro_name: display_inactivity_issues_in_multiple_display_configurations_in_windows_10
ro_ref: 231214163036/display_inactivity_issues_in_multiple_display_configurations_in_windows_10
lang: zh
---
我是一名随身携带笔记本电脑并且有时在家工作的用户。我在工作和家里使用连接到笔记本电脑的两个或多个显示器，但有时笔记本电脑只能识别某些显示器，并且当我进入显示设置时显示为非活动状态。  

我的猜测是Windows通过将其以预设的形式存储在注册表中来管理适合每个环境的显示配置，但似乎这个问题有时是由于此配置的扭曲引起的。  

我发现解决这个问题的方法是删除并初始化Windows显示配置注册表值。总之，您需要重新设置多显示环境。我会解释如何做。  
## 1.打开Windows注册表编辑器
使用`Windows + R`通过`运行`对话框输入`regedit`，或在`开始`菜单中搜索`regedit.exe`以运行`注册表编辑器`。  
![Windows + R > 输入`regedit`](/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-windows_+_r_enter_regedit.png)
_Windows + R > 输入`regedit`_

## 2.删除注册表编辑器中的显示预设值
在注册表编辑器中，在地址栏中输入下面的路径或导航到树中的路径。  

```
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers
```
从右键菜单中删除`GraphicsDrivers`文件夹中的以下两个文件夹。  
- Configuration
- Connectivity

![注册表编辑器 - 删除`GraphicsDrivers`文件夹中的`Configuration`和`Connectivity`文件夹](/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-registry_editor-remove_the_configuration_and_connectivity_folders_in_the_graphicsdrivers_folder.png)
_注册表编辑器 - 删除`GraphicsDrivers`文件夹中的`Configuration`和`Connectivity`文件夹_

## 3. 重新启动Windows
重新启动 Windows。重新启动完成后，从 Windows 的角度来看，我的显示器将成为新识别的显示器。  

因此，您需要在显示设置中重置显示的位置和方向。简而言之，这很烦人。我谨致以诚挚的哀悼。  
