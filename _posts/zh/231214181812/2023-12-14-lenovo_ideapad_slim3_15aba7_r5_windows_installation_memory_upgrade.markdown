---
title:  联想Ideapad Slim3 15ABA7 R5 Windows安装、内存升级
image:
  path: /assets/images/231214181812/zh-thumb-unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade.png
  alt: 联想Ideapad Slim3 15ABA7 R5 Windows安装、内存升级
images: ["/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-ventoy-www.ventoy.net-a_new_bootable_usb_solution.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-bios_security_secure_boot_disabled.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-윈도우11_설치-네트워크_연결_설정_진행불가.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면-나사_제거.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면판_열기.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_커버의_스티커_분리.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_장착.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-신규_메모리_동작_확인을_위해_하단_공간_확보.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-cpu-z-메모리.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-hwinfo64-시스템_요약-메모리.png"]
categories: [它, 个人电脑]
tags: [它, 个人电脑, 联想, 笔记本电脑]
description:  Lenovo Slim3 15ABA7 R5 安装了 Free DOS 作为默认操作系统，因此必须单独安装 Windows。让我们了解一下安装 Windows 以及如何升级内存的基础知识。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-14 18:18:12 +0900
ro_id: 231214181812
ro_name: lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade
ro_ref: 231214181812/lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade
lang: zh
---
**Lenovo Slim3 15ABA7 R5**安装了 Free DOS 作为默认操作系统，因此必须单独安装 Windows。  

让我们了解一下安装 Windows 以及如何升级内存的基础知识。  
## 规格
![联想 Slim3 15ABA7 R5](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5.png)
_联想 Slim3 15ABA7 R5_

**Lenovo Slim3 15ABA7 R5**搭载的是Ryzen 5第四代(塞尚)5625U型号作为CPU。简而言之，由于它是一款高性价比笔记本电脑，因此它具有内置显卡，共享CPU中包含的GPU。  

虽然价格相对较低，但它是一款性能可用的高性价比笔记本电脑，但其优势在于内存和硬盘的可扩展性。  
- **存储设备**：标配NVMe M.2 SSD 256GB + 1个额外2.5英寸SATA硬盘插槽
- **内存**：板载 8GB (DDR4-3200) + 1 个附加插槽

可额外升级1个SATA硬盘和1个DDR4内存。  
## 准备 Windows USB 记忆棒
![Ventoy - www.ventoy.net - 全新的可启动 USB 解决方案](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-ventoy-www.ventoy.net-a_new_bootable_usb_solution.png)
_Ventoy - www.ventoy.net - 全新的可启动 USB 解决方案_

一般来说，要安装 Windows，通常会将可启动的 Windows 映像刻录到 U 盘上并进行安装。但是，我们将使用一个名为 [Ventoy](https://www.ventoy.net/en/download.html){:target="_blank"} 的程序。  

如果您将 Ventoy 软件刻录到 U 盘，Windows 会将其识别为可移动磁盘。然后，如果您复制下载的 Windows ISO 文件并启动计算机，则可以选择 USB 记忆棒上保存的 ISO 文件并启动。这样做的优点是允许您通过将多个 ISO 文件复制到单个 USB 记忆棒来选择性地启动和安装。  
- **如何在 U 盘上安装 Ventoy**：https://www.ventoy.net/en/doc_start.html

Lenovo驱动程序站点支持Windows 10和Windows 11的系统驱动程序，但我安装了Windows 11。  

准备一个 U 盘，其中包含复制到 Ventoy 底座的 Windows ISO 文件。  

并且，在 Lenovo 驱动程序网站上，[无线 LAN 驱动程序](https://pcsupport.lenovo.com/kr/en/products/laptops-and-netbooks/3-series/ideapad-3-15aba7/downloads/driver-list){:target="_blank"}下载并将其保存到 U 盘。  

在安装 Windows 11 的情况下，Windows ISO 映像不包含无线 LAN 驱动程序，因此以后无法通过 Internet 执行初始 Windows 设置。因此，您需要提前准备无线网卡驱动程序。  
## BIOS 设置和 Windows 安装
打开联想Slim3 15ABA7 R5的显示屏。笔记本电脑将自动开机，按几次`F2`进入 BIOS 设置屏幕。  

使用 Ventoy 启动时，会出现与安全验证相关的错误。为防止这种情况，请在`Security`菜单中将`Secure Boot`更改为`Disable`。将 U 盘插入笔记本电脑，保存 BIOS 设置并退出。  
![BIOS > 安全 > 安全启动 > 已禁用](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-bios_security_secure_boot_disabled.png)
_BIOS > 安全 > 安全启动 > 已禁用_

> **打开笔记本电脑显示屏时禁用自动开机**  
> 联想可能认为在笔记本电脑显示屏打开时自动打开笔记本电脑显示屏有利于用户的方便。  
> 如果您不喜欢此功能，可以将 BIOS 中`Configuration`菜单中的`Flip to Boot`功能更改为`Disabled`。  
{: .prompt-info}
从 Ventory 启动菜单中选择 Windows ISO 并安装 Windows。  

**Lenovo Slim3 15ABA7 R5**在安装 Windows 11 时不会自动安装无线 LAN 驱动程序。因此，无法再继续进行`网络连接`设置阶段。  
![Windows 11 安装 - 无法继续进行`网络连接`设置](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-윈도우11_설치-네트워크_연결_설정_진행불가.png)
_Windows 11 安装 - 无法继续进行`网络连接`设置_

在该屏幕上，按`Shift + F10`打开命令提示符窗口。然后输入`OOBE\BYPASSNRO`。  

之后，它会自动重新启动，之后您可以跳过`网络连接`设置。  

```
OOBE\BYPASSNRO
```
Windows 安装完成后，安装保存在 U 盘上的无线 LAN 驱动程序。然后，访问 [Lenovo 驱动程序站点](https://pcsupport.lenovo.com/kr/ko/products/laptops-and-netbooks/3-series/ideapad-3-15aba7/downloads){:target="_blank"} 并安装剩余的驱动程序不能安装。  
## 内存购买
如下图所示，**Lenovo Slim3 15ABA7 R5**板载8GB DDR4-3200内存。因此，要创建双通道内存配置，请购买 8GB DDR4-3200 时钟内存。  
- **内存**：板载 8GB (DDR4-3200) + 1 个附加插槽

如果商场里有时钟标为DDR4-3200或PC4-25600的内存，可以购买。  
## 安装内存升级
将笔记本电脑正面朝下放在软布上，然后拧下背面的所有螺钉。  
![Lenovo Slim3 15ABA7 R5 - 后部 - 卸下螺丝](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면-나사_제거.png)
_Lenovo Slim3 15ABA7 R5 - 后部 - 卸下螺丝_

然后，将未使用的塑料卡插入右上角的缝隙中以打开后面板。然后，像打开一罐罐头食品一样，一点点转动打开后面板。如果塑料卡插入太深，可能会损坏笔记本电脑主板，因此请仅插入一点。  
![Lenovo Slim3 15ABA7 R5 - 打开后面板](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면판_열기.png)
_Lenovo Slim3 15ABA7 R5 - 打开后面板_

如上所述，可以额外升级1个SATA硬盘和1个DDR4内存。  
![联想 Slim3 15ABA7 R5 - 内部](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부.png)
_联想 Slim3 15ABA7 R5 - 内部_

与其他笔记本电脑不同，**Lenovo Slim3 15ABA7 R5**有内存插槽盖。撕掉盖子上的少量贴纸，然后向上提起盖子将其取下。  
![Lenovo Slim3 15ABA7 R5 - 内部 - 撕掉内存盖上的贴纸](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_커버의_스티커_분리.png)
_Lenovo Slim3 15ABA7 R5 - 内部 - 撕掉内存盖上的贴纸_

如果您已安装内存，请重新安装内存盖并贴上贴纸。  
![Lenovo Slim3 15ABA7 R5 - 内部 - 已安装内存](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_장착.png)
_Lenovo Slim3 15ABA7 R5 - 内部 - 已安装内存_

在关闭后面板之前，请确保笔记本电脑已打开并正常启动。如果由于内存接触不良而无法开机，则必须重新打开后面板，因此在不关闭后面板的情况下检查开机是否正常。  

将烟盒之类的东西放在笔记本电脑的铰链上，以防止风扇旋转，然后打开笔记本电脑。如果内存无法正确识别或无法启动，请尝试拔出内存并重新安装。  
![Lenovo Slim3 15ABA7 R5 - 安全底部空间以检查新内存操作](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-신규_메모리_동작_확인을_위해_하단_공간_확보.png)
_Lenovo Slim3 15ABA7 R5 - 安全底部空间以检查新内存操作_

如果笔记本电脑运行正常，请关闭后面板并重新拧紧松动的螺钉。  
## 检查内存双通道识别
安装[CPU-Z](https://www.cpuid.com/softwares/cpu-z.html){:target="_blank"}或[HWiNFO64](https://www.hwinfo.com/download/){:target="_blank"}或下载便携式版本。 .  

在CPU-Z中，如果内存运行为[双通道](https://en.wikipedia.org/wiki/Multi-channel_memory_architecture){:target="_blank"}，通道通常显示为`Dual`，**Lenovo Slim3 15ABA7 R5**为显示为`2 x 64 位`。  

我不确定这是一个错误还是最新版本的 CPU-Z 的差异。  
![Lenovo Slim3 15ABA7 R5 - CPU-Z - 内存](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-cpu-z-메모리.png)
_Lenovo Slim3 15ABA7 R5 - CPU-Z - 内存_

但是，在 HWiNFO64 中，它正确显示为`双通道`。  
![Lenovo Slim3 15ABA7 R5 - HWiNFO64 - 系统摘要 - 内存](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-hwinfo64-시스템_요약-메모리.png)
_Lenovo Slim3 15ABA7 R5 - HWiNFO64 - 系统摘要 - 内存_

