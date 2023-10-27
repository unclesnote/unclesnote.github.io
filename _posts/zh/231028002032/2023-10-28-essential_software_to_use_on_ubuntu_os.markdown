---
title:  Ubuntu 操作系统上使用的基本软件
image:
  path: /assets/images/231028002032/zh-thumb-basic_setting_-_general.png
  alt: Ubuntu 操作系统上使用的基本软件
images: ["/assets/images/231028002032/basic_setting_-_general.svg", "/assets/images/231028002032/basic_setting_-_general-krusader.png", "/assets/images/231028002032/basic_setting_-_general-gwenview.png", "/assets/images/231028002032/basic_setting_-_general-enable-log-resource-usage-mode.png", "/assets/images/231028002032/basic_setting_-_general-photopea.png", "/assets/images/231028002032/basic_setting_-_general-photopea-adblock.png", "/assets/images/231028002032/basic_setting_-_general-krita.png", "/assets/images/231028002032/basic_setting_-_general-krita-downdlaod-appimage.png", "/assets/images/231028002032/basic_setting_-_general-easystroke.png", "/assets/images/231028002032/basic_setting_-_general-easystroke-download.png"]
categories: [乌班图, 工具]
tags: [克鲁萨德, 格温维尤, 光豌豆, 克里塔, 易中风, 图像浏览器, 图片编辑器, 文件浏览器, 鼠标宏, 乌班图, 工具]
description:  如果您因为 Ubuntu 操作系统的特定优势而使用 Ubuntu，您会尝试在 Ubuntu 环境中找到与您在 Windows 环境中使用的类似软​​件。因此，我将介绍一些在使用 Ubuntu 时通常很好用的软件，例如文件浏览器、图像查看/编辑器和生产力工具。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-28 00:20:32 +0900
ro_id: 231028002032
ro_name: essential_software_to_use_on_ubuntu_os
ro_ref: 231028002032/essential_software_to_use_on_ubuntu_os
lang: zh
---
如果您因为 Ubuntu 操作系统的特定优势而使用 Ubuntu，您会尝试在 Ubuntu 环境中找到与您在 Windows 环境中使用的类似软​​件。因此，我将介绍一些在使用 Ubuntu 时通常很好用的软件，例如文件浏览器、图像查看/编辑器和生产力工具。  
![Ubuntu 软件](/assets/images/231028002032/basic_setting_-_general.svg)  

Ubuntu 软件
{: style="color:gray; font-size: 80%; text-align: center;"}

## 文件浏览器
### 克鲁萨德
如果您有在 Windows 环境中使用 [Q-Dir](http://www.q-dir.com){:target="_blank"} 或 [Total Commander](https://www.ghisler.com/download.htm){:target="_blank"} 的经验，[Krusader ](https://krusader.org){:target="_blank"} 提供分割窗口和多选项卡文件浏览的体验。  
![克鲁萨德](/assets/images/231028002032/basic_setting_-_general-krusader.png)  

克鲁萨德
{: style="color:gray; font-size: 80%; text-align: center;"}

安装方法非常简单。您可以使用 apt 安装它。  

```shell
sudo apt update
sudo apt install krusader
```
## 图像查看器/编辑器
### 格温维尤
[GwenView](https://github.com/KDE/gwenview){:target="_blank"} 是我用过的最好的 Ubuntu 图像查看器。如果我找到更好的图像查看器，我会更新。  
![格温维尤](/assets/images/231028002032/basic_setting_-_general-gwenview.png)  

格温维尤
{: style="color:gray; font-size: 80%; text-align: center;"}

但是，如果您经常更新图像文件，有时 GwenView 列表中的缩略图的外观与实际图像可能会有所不同。因此，建议禁用缩略图缓存的使用。  
在`设置 > 配置 Gwenview > 高级`中，选中`低资源使用模式`。  
![GwenView - 检查`低资源使用模式`以禁用缩略图缓存](/assets/images/231028002032/basic_setting_-_general-enable-log-resource-usage-mode.png)  

GwenView - 检查`低资源使用模式`以禁用缩略图缓存
{: style="color:gray; font-size: 80%; text-align: center;"}

GwenView 可以使用 apt 轻松安装。  

```shell
sudo apt install gwenview -y
```
### 光豌豆
对于熟悉 Photoshop 的人来说，最好的选择似乎是 [Photopia](https://www.photopea.com){:target="_blank"}。 Photopia 是一款网络应用程序，提供与 Photoshop 最相似的界面。  
![Photopea - www.photopea.com](/assets/images/231028002032/basic_setting_-_general-photopea.png)  

Photopea - www.photopea.com
{: style="color:gray; font-size: 80%; text-align: center;"}

有类似Photopia的网站，但Photopia的优势在于它允许广告拦截器拦截网络上的广告，这就是他们的收入模式。如果您是 Chrome 浏览器用户，请在网上商店中搜索`AdBlock`并安装它。  
即使不使用`AdBlock`，与其他网站相比，右侧面板上显示的广告数量也有限，因此并不太烦人。  
![Photopea - 右侧面板上的有限广告和 Chrome 网络浏览器上的 AdBlock 扩展](/assets/images/231028002032/basic_setting_-_general-photopea-adblock.png)  

Photopea - 右侧面板上的有限广告和 Chrome 网络浏览器上的 AdBlock 扩展
{: style="color:gray; font-size: 80%; text-align: center;"}

### 克里塔
如果您正在寻找与 Photopia 不同的离线图像编辑器，Krita 可能是一个选择。然而，对于非常熟悉Photoshop的用户来说，可能会感到陌生。 GUI 界面与 Photoshop 类似，但快捷方式和工具在很多方面有所不同。  
![克里塔](/assets/images/231028002032/basic_setting_-_general-krita.png)  

克里塔
{: style="color:gray; font-size: 80%; text-align: center;"}

虽然它并不完全类似于 Photoshop，但如果您想要编辑或绘制图像并正在寻找一个完整的软件，Krita 可能是一个不错的选择。  
Krita 以应用程序映像的形式分发软件。访问下面的 Krita 站点并下载适用于 Linux 的应用程序映像。  
- [https://krita.org/en/download/krita-desktop](https://krita.org/en/download/krita-desktop)

![Krita - 下载 Linux AppImage](/assets/images/231028002032/basic_setting_-_general-krita-downdlaod-appimage.png)  

Krita - 下载 Linux AppImage
{: style="color:gray; font-size: 80%; text-align: center;"}

为下载的 Krita 应用程序映像授予执行权限并运行它。  

```shell
cd ~/Downloads
chmod 777 *.appimage
```
## 生产率
### 轻松手势（鼠标手势宏）
如果您有在 Windows 上使用 [Strokeit](https://www.tcbmi.com/Strokeit){:target="_blank"} 鼠标手势宏软件的经验，`Easyrinkle Gesture`是 Ubuntu 的最佳替代方案。  
如果你想用`鼠标右键`绘制手势，则需要进行以下设置。事实上，让它在启动时自动运行是一个重要的选项。  
在 Easyrinkle Preferences 选项卡中，将 Behaviour 设置为`Button 3`，并在 Appearance 中将其设置为自动运行。  
可以在`操作`选项卡中添加鼠标手势操作。  
![EasyStrike - 偏好设置](/assets/images/231028002032/basic_setting_-_general-easystroke.png)  

EasyStrike - 偏好设置
{: style="color:gray; font-size: 80%; text-align: center;"}

您可以通过在 Ubuntu Software 应用程序中搜索它来轻松安装它。  
![EasyStrike - 在 Ubuntu 软件中下载](/assets/images/231028002032/basic_setting_-_general-easystroke-download.png)  

EasyStrike - 在 Ubuntu 软件中下载
{: style="color:gray; font-size: 80%; text-align: center;"}

以下是我通过将它们映射到鼠标手势来使用的一些快捷键。  

|应用程序|快捷方式|描述|
| ------- | ---------------- | ----------------- |
|常见的|Ctrl + 主页|转到页面顶部|
|常见的|Ctrl + 结束|转到页面底部|
|VS代码|Ctrl + Alt + -|回去|
|VS代码|Ctrl + Shift + -|前进|

