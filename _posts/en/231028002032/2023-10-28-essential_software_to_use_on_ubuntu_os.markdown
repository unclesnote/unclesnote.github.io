---
title:  Essential alternative software for Ubuntu instead of Windows tools
image:
  path: /assets/images/231028002032/en-thumb-basic_setting_-_general-gwenview.png
  alt: Essential alternative software for Ubuntu instead of Windows tools
images: ["/assets/images/231028002032/basic_setting_-_general.svg", "/assets/images/231028002032/basic_setting_-_general-krusader.png", "/assets/images/231028002032/basic_setting_-_general-gwenview.png", "/assets/images/231028002032/basic_setting_-_general-enable-log-resource-usage-mode.png", "/assets/images/231028002032/basic_setting_-_general-photopea.png", "/assets/images/231028002032/basic_setting_-_general-photopea-adblock.png", "/assets/images/231028002032/basic_setting_-_general-krita.png", "/assets/images/231028002032/basic_setting_-_general-krita-downdlaod-appimage.png", "/assets/images/231028002032/basic_setting_-_general-easystroke.png", "/assets/images/231028002032/basic_setting_-_general-easystroke-download.png"]
categories: [Ubuntu, Tools]
tags: [Krusader, GwenView, Photopea, Krita, Easystroke, ImageViwer, ImageEditor, FileBrowser, MouseMacro, Ubuntu, Tools]
description:  If you are using Ubuntu because of the specific advantages of the Ubuntu OS, you will try to find similar software available in the Ubuntu environment that you used in the Windows environment. So, I will introduce some software that is generally good to use when using Ubuntu, such as a file browser, image viewer/editor, and productivity tools.
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
![Ubuntu Softwares](/assets/images/231028002032/basic_setting_-_general.svg)  

Ubuntu Softwares
{: style="color:gray; font-size: 80%; text-align: center;"}

## **File Browser**
### Krusader
If you have experience using Q-Dir or [Total Commander](https://www.ghisler.com/download.htm){:target="_blank"} in a Windows environment, [Krusader](https://krusader.org){:target="_blank"} offers the experience of split windows and multi-tab file browsing.  
![Krusader](/assets/images/231028002032/basic_setting_-_general-krusader.png)  

Krusader
{: style="color:gray; font-size: 80%; text-align: center;"}

The installation method is very easy. You can install it using apt.  

```shell
sudo apt update
sudo apt install krusader
```
## **Image Viewer/Editor**
### GwenView
[GwenView](https://github.com/KDE/gwenview){:target="_blank"} is the best Ubuntu image viewer I've ever used. I will update if I find a better image viewer.  
![GwenView](/assets/images/231028002032/basic_setting_-_general-gwenview.png)  

GwenView
{: style="color:gray; font-size: 80%; text-align: center;"}

However, if you frequently update image files, sometimes the appearance of the thumbnail in the GwenView list and the actual image may differ. Therefore, it is recommended to disable the use of thumbnail cache.  
In `Settings > Configure Gwenview > Advanced`, check `Low resource usage mode`.  
![GwenView - Check `Low resource usage mode` for disabling thumbnail cache](/assets/images/231028002032/basic_setting_-_general-enable-log-resource-usage-mode.png)  

GwenView - Check `Low resource usage mode` for disabling thumbnail cache
{: style="color:gray; font-size: 80%; text-align: center;"}

GwenView can be easily installed using apt.  

```shell
sudo apt install gwenview -y
```
### Photopea
For those familiar with Photoshop, the best alternative seems to be [Photopia](https://www.photopea.com){:target="_blank"}. Photopia is a web app that provides an interface most similar to Photoshop.  
![Photopea - www.photopea.com](/assets/images/231028002032/basic_setting_-_general-photopea.png)  

Photopea - www.photopea.com
{: style="color:gray; font-size: 80%; text-align: center;"}

There are websites similar to Photopia, but Photopia's advantage is that it allows ad blockers to block advertisements on the web, which is their revenue model. If you are a Chrome browser user, search for `AdBlock` in the web store and install it.  
Even if `AdBlock` is not used, ads are displayed in a limited amount on the right panel compared to other sites, so it is not too annoying.  
![Photopea - Limited ads on right panel and AdBlock extension on the Chrome web browser](/assets/images/231028002032/basic_setting_-_general-photopea-adblock.png)  

Photopea - Limited ads on right panel and AdBlock extension on the Chrome web browser
{: style="color:gray; font-size: 80%; text-align: center;"}

### Krita
If you're looking for an offline image editor that's different from Photopia, Krita may be an alternative. However, users who are very familiar with Photoshop may feel unfamiliar. The GUI interface is similar to Photoshop, but the shortcuts and tools differ in many ways.  
![Krita](/assets/images/231028002032/basic_setting_-_general-krita.png)  

Krita
{: style="color:gray; font-size: 80%; text-align: center;"}

Although it is not completely similar to Photoshop, if you want to edit or draw images and are looking for a complete software, Krita may be a good option.  
Krita distributes software in the form of app images. Visit the Krita site below and download the app image for Linux.  
- [https://krita.org/en/download/krita-desktop](https://krita.org/en/download/krita-desktop)

![Krita - Download Linux AppImage](/assets/images/231028002032/basic_setting_-_general-krita-downdlaod-appimage.png)  

Krita - Download Linux AppImage
{: style="color:gray; font-size: 80%; text-align: center;"}

Give execution permission to the downloaded Krita app image and run it.  

```shell
cd ~/Downloads
chmod 777 *.appimage
```
## **Productivity**
### Easystroke Gesture(Mouse Gesture Macro)
If you have experience using [Strokeit](https://www.tcbmi.com/strokeit){:target="_blank"} mouse gesture macro software on Windows, `Easystroke Gesture` is the best alternative for Ubuntu.  
If you want to draw a gesture with the `right mouse button`, you need the settings below. In fact, having it run automatically when booting is an essential option.  
In the Easystroke Preferences tab, set Behavior to `Button 3` and set it to run automatically in Appearance.  
Mouse gesture actions can be added in the `Actions` tab.  
![Easystroke - Preferences](/assets/images/231028002032/basic_setting_-_general-easystroke.png)  

Easystroke - Preferences
{: style="color:gray; font-size: 80%; text-align: center;"}

You can easily install it by searching for it in Ubuntu Software app.  
![Easystroke - Download in Ubuntu Software](/assets/images/231028002032/basic_setting_-_general-easystroke-download.png)  

Easystroke - Download in Ubuntu Software
{: style="color:gray; font-size: 80%; text-align: center;"}

Below are some shortcut keys that I am using by mapping them to mouse gestures.  

| App     | Shortcuts        | Description       |
| ------- | ---------------- | ----------------- |
| Common  | Ctrl + Home      | Go Top on Page    |
| Common  | Ctrl + End       | Go Bottom on Page |
| VS Code | Ctrl + Alt + -   | Go Back           |
| VS Code | Ctrl + Shift + - | Go Forward        |

