---
title:  Display inactivity issues in multiple display configurations in Windows 10
image:
  path: /assets/images/231214163036/en-thumb-unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10.png
  alt: Display inactivity issues in multiple display configurations in Windows 10
images: ["/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-windows_+_r_enter_regedit.png", "/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-registry_editor-remove_the_configuration_and_connectivity_folders_in_the_graphicsdrivers_folder.png"]
categories: [Computer, TroubleShooting]
tags: [Computer, TroubleShooting]
description:  I am a user who uses one laptop between work and home. I use two or more displays connected to my laptop both at work and at home, but sometimes only some
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-14 16:30:36 +0900
ro_id: 231214163036
ro_name: display_inactivity_issues_in_multiple_display_configurations_in_windows_10
ro_ref: 231214163036/display_inactivity_issues_in_multiple_display_configurations_in_windows_10
lang: en
---
I am a user who uses one laptop between work and home. I use two or more displays connected to my laptop both at work and at home, but sometimes only some displays are recognized by the laptop and are displayed as inactive when I go into the display settings.  

My guess is that Windows manages the display configuration suitable for each environment by storing it in the registry in the form of a preset, but it seems that this problem is sometimes caused by a twist in this configuration.  

The method I found to solve this problem is to delete and initialize the Windows display configuration registry value. In conclusion, you need to set up the multi-display environment again. I will explain how.  
## 1. Open Windows Registry Editor
Enter `regedit` through the Run dialog with `Windows + R` or search for `regedit.exe` in Start menu to run `Registry Editor`.  

![Windows + R > Enter `regedit`](/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-windows_+_r_enter_regedit.png)
_Windows + R > Enter `regedit`_

## 2. Delete display preset values in Registry Editor
In Registry Editor, enter the path below in the address bar or navigate to the path in the tree.  

```
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers
```
Remove the following two folders in the `GraphicsDrivers` folder from the right-click menu.  
- Configuration
- Connectivity


![Registry Editor - Remove the `Configuration` and `Connectivity` folders in the `GraphicsDrivers` folder](/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-registry_editor-remove_the_configuration_and_connectivity_folders_in_the_graphicsdrivers_folder.png)
_Registry Editor - Remove the `Configuration` and `Connectivity` folders in the `GraphicsDrivers` folder_

## 3. Reboot the Windows
Restart Windows. Once the reboot is complete, from Windows' perspective, my displays become newly recognized displays.  

Therefore, you need to reset the position and orientation of the displays in the display settings. In short, this is very annoying. I offer my sincere condolences.  
