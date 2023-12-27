---
title:  Essential alternative software for Ubuntu instead of Windows tools
image:
  path: /assets/images/231028002032/en-thumb-unclesnote-essential_software_to_use_on_ubuntu_os.png
  alt: Essential alternative software for Ubuntu instead of Windows tools
images: ["/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-ubuntu_softwares.svg", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krusader.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-gwenview.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-gwenview-check_low_resource_usage_mode_for_disabling_thumbnail_cache.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-photopea-www.photopea.com.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-photopea-limited_ads_on_right_panel_and_adblock_extension_on_the_chrome_web_browser.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krita.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krita-download_linux_appimage.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-easystroke-preferences.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-easystroke-download_in_ubuntu_software.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-ubuntu_software-bleachbit.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-bleachbit.png"]
categories: [Ubuntu, Tools]
tags: [Krusader, GwenView, Photopea, Krita, Easystroke, ImageViwer, ImageEditor, FileBrowser, MouseMacro, Ubuntu, Tools, BleachBit, FreeSpace]
description:  If you are using Ubuntu because of the specific advantages of the Ubuntu OS, you will try to find similar software available in the Ubuntu environment that you
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-28 00:20:32 +0900
ro_id: 231028002032
ro_name: essential_software_to_use_on_ubuntu_os
ro_ref: 231028002032/essential_software_to_use_on_ubuntu_os
lang: en
---
If you are using Ubuntu because of the specific advantages of the Ubuntu OS, you will try to find similar software available in the Ubuntu environment that you used in the Windows environment. So, I will introduce some software that is generally good to use when using Ubuntu, such as a file browser, image viewer/editor, and productivity tools.  
![Ubuntu Softwares](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-ubuntu_softwares.svg)
_Ubuntu Softwares_

## File Browser
### Krusader
If you have experience using Q-Dir or [Total Commander](https://www.ghisler.com/download.htm){:target="_blank"} in a Windows environment, [Krusader](https://krusader.org){:target="_blank"} offers the experience of split windows and multi-tab file browsing.  
![Krusader](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krusader.png)
_Krusader_

The installation method is very easy. You can install it using apt.  

```shell
sudo apt update
sudo apt install krusader
```
## Image Viewer/Editor
### GwenView
[GwenView](https://github.com/KDE/gwenview){:target="_blank"} is the best Ubuntu image viewer I've ever used. I will update if I find a better image viewer.  
![GwenView](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-gwenview.png)
_GwenView_

However, if you frequently update image files, sometimes the appearance of the thumbnail in the GwenView list and the actual image may differ. Therefore, it is recommended to disable the use of thumbnail cache.  

In `Settings > Configure Gwenview > Advanced`, check `Low resource usage mode`.  
![GwenView - Check `Low resource usage mode` for disabling thumbnail cache](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-gwenview-check_low_resource_usage_mode_for_disabling_thumbnail_cache.png)
_GwenView - Check `Low resource usage mode` for disabling thumbnail cache_

GwenView can be easily installed using apt.  

```shell
sudo apt install gwenview -y
```
### Photopea
For those familiar with Photoshop, the best alternative seems to be [Photopia](https://www.photopea.com){:target="_blank"}. Photopia is a web app that provides an interface most similar to Photoshop.  
![Photopea - www.photopea.com](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-photopea-www.photopea.com.png)
_Photopea - www.photopea.com_

There are websites similar to Photopia, but Photopia's advantage is that it allows ad blockers to block advertisements on the web, which is their revenue model. If you are a Chrome browser user, search for `AdBlock` in the web store and install it.  

Even if `AdBlock` is not used, ads are displayed in a limited amount on the right panel compared to other sites, so it is not too annoying.  
![Photopea - Limited ads on right panel and AdBlock extension on the Chrome web browser](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-photopea-limited_ads_on_right_panel_and_adblock_extension_on_the_chrome_web_browser.png)
_Photopea - Limited ads on right panel and AdBlock extension on the Chrome web browser_

### Krita
If you're looking for an offline image editor that's different from Photopia, Krita may be an alternative. However, users who are very familiar with Photoshop may feel unfamiliar. The GUI interface is similar to Photoshop, but the shortcuts and tools differ in many ways.  
![Krita](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krita.png)
_Krita_

Although it is not completely similar to Photoshop, if you want to edit or draw images and are looking for a complete software, Krita may be a good option.  

Krita distributes software in the form of app images. Visit the Krita site below and download the app image for Linux.  
- [https://krita.org/en/download/krita-desktop](https://krita.org/en/download/krita-desktop)

![Krita - Download Linux AppImage](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krita-download_linux_appimage.png)
_Krita - Download Linux AppImage_

Give execution permission to the downloaded Krita app image and run it.  

```shell
cd ~/Downloads
chmod 777 *.appimage
```
## Productivity
### Easystroke Gesture(Mouse Gesture Macro)
If you have experience using [Strokeit](https://www.tcbmi.com/strokeit){:target="_blank"} mouse gesture macro software on Windows, `Easystroke Gesture` is the best alternative for Ubuntu.  

If you want to draw a gesture with the `right mouse button`, you need the settings below. In fact, having it run automatically when booting is an essential option.  

In the Easystroke Preferences tab, set Behavior to `Button 3` and set it to run automatically in Appearance.  

Mouse gesture actions can be added in the `Actions` tab.  
![Easystroke - Preferences](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-easystroke-preferences.png)
_Easystroke - Preferences_

You can easily install it by searching for it in Ubuntu Software app.  
![Easystroke - Download in Ubuntu Software](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-easystroke-download_in_ubuntu_software.png)
_Easystroke - Download in Ubuntu Software_

Below are some shortcut keys that I am using by mapping them to mouse gestures.  

| App     | Shortcuts        | Description       |
| ------- | ---------------- | ----------------- |
| Common  | Ctrl + Home      | Go Top on Page    |
| Common  | Ctrl + End       | Go Bottom on Page |
| VS Code | Ctrl + Alt + -   | Go Back           |
| VS Code | Ctrl + Shift + - | Go Forward        |

## System
### BleachBit(Cleaner For FreeSpace)
[BleachBit](https://www.bleachbit.org/features){:target="_blank"} is useful software to free up space by deleting unnecessary files. In addition to Linux, it supports various operating systems such as Windows and Mac OS.  

You can easily install it by searching for `bleachbit` in the Ubuntu software application.  
![Ubuntu Software - BleachBit](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-ubuntu_software-bleachbit.png)
_Ubuntu Software - BleachBit_

After checking the items you want to organize, pressing the `Clean` button automatically deletes unnecessary files to secure free space. However, you must be careful when organizing the `APT` and `journald` items. This may break your Ubuntu system or package dependencies.  
![BleachBit](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-bleachbit.png)
_BleachBit_

