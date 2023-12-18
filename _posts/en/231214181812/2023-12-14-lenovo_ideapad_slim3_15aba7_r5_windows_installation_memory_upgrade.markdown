---
title:  Lenovo Ideapad Slim3 15ABA7 R5 Windows installation, memory upgrade
image:
  path: /assets/images/231214181812/en-thumb-unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade.png
  alt: Lenovo Ideapad Slim3 15ABA7 R5 Windows installation, memory upgrade
images: ["/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-ventoy-www.ventoy.net-a_new_bootable_usb_solution.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-bios_security_secure_boot_disabled.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-윈도우11_설치-네트워크_연결_설정_진행불가.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면-나사_제거.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면판_열기.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_커버의_스티커_분리.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_장착.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-신규_메모리_동작_확인을_위해_하단_공간_확보.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-cpu-z-메모리.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-hwinfo64-시스템_요약-메모리.png"]
categories: [IT, PC]
tags: [IT, PC, Lenovo, Laptop]
description:  Lenovo Slim3 15ABA7 R5 has Free DOS installed as the default OS, so Windows must be installed separately. Let`s look at the basics for installing Windows and
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-14 18:18:12 +0900
ro_id: 231214181812
ro_name: lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade
ro_ref: 231214181812/lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade
lang: en
---
**Lenovo Slim3 15ABA7 R5**has Free DOS installed as the default OS, so Windows must be installed separately.  

Let`s look at the basics for installing Windows and how to upgrade memory.  
## spec
![Lenovo Slim3 15ABA7 R5](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5.png)
_Lenovo Slim3 15ABA7 R5_

**Lenovo Slim3 15ABA7 R5**is equipped with the 5625U model of Ryzen 5 4th generation (Cezanne) as the CPU. In short, since it is a cost-effective laptop, it has built-in graphics that share the GPU included in the CPU.  

Although the price is relatively cheap, it is a cost-effective laptop with usable performance, but its advantage lies in the expandability of the memory and hard disk.  
- **Storage device**: NVMe M.2 SSD 256GB installed as standard + 1 additional 2.5-inch SATA hard disk slot
- **Memory**: 8GB onboard (DDR4-3200) + 1 additional socket

One SATA hard disk and one DDR4 memory can be additionally upgraded.  
## Preparing a Windows USB stick
![Ventoy - www.ventoy.net - A New Bootable USB Solution](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-ventoy-www.ventoy.net-a_new_bootable_usb_solution.png)
_Ventoy - www.ventoy.net - A New Bootable USB Solution_

Generally, to install Windows, it is common to burn a bootable Windows image onto a USB stick and install it. However, we will use a program called [Ventoy](https://www.ventoy.net/en/download.html){:target="_blank"}.  

If you burn the Ventoy software to a USB stick, Windows will recognize it as a removable disk. Then, if you copy the downloaded Windows ISO file and start the computer, you can select the ISO file saved on the USB stick and boot. This has the advantage of allowing you to selectively boot and install by copying several ISO files to a single USB stick.  
- **How ​​to install Ventoy on a USB stick**: https://www.ventoy.net/en/doc_start.html

The Lenovo driver site supports system drivers for Windows 10 and Windows 11, but I installed Windows 11.  

Prepare a USB stick with the Windows ISO file copied to the Ventoy base.  

And, on the Lenovo driver site, [Wireless LAN driver](https://pcsupport.lenovo.com/kr/en/products/laptops-and-netbooks/3-series/ideapad-3-15aba7/downloads/driver-list){:target="_blank"} Download and save it to a USB stick.  

In the case of Windows 11 installation, the Windows ISO image does not include a wireless LAN driver, so initial Windows setup via the Internet cannot be performed later. So, you need to prepare a wireless LAN driver in advance.  
## BIOS setup and Windows installation
Open the display of Lenovo Slim3 15ABA7 R5. The laptop will automatically turn on. Press ‘F2’ repeatedly to enter the BIOS setup screen.  

When booting with Ventoy, an error related to Securiy Verification occurs. To prevent this, change `Secure Boot` to `Disable` in the `Security` menu. Insert the USB stick into the laptop, save the BIOS settings and exit.  
![BIOS > Security > Secure Boot > Disabled](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-bios_security_secure_boot_disabled.png)
_BIOS > Security > Secure Boot > Disabled_

> **Disable auto power on when laptop display is opened**  
> Lenovo probably thought that automatically turning on the laptop display when opened was good for user convenience.  
> If you do not like this feature, you can change the `Flip to Boot` feature in the `Configuration` menu in BIOS to `Disabled`.  
{: .prompt-info}
Select the Windows ISO from the Ventory boot menu and install Windows.  

**Lenovo Slim3 15ABA7 R5**does not automatically install the wireless LAN driver when installing Windows 11. Therefore, it is no longer possible to proceed at the ‘network connection’ setup stage.  
![Windows 11 installation - Cannot proceed with ‘Network Connection’ settings](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-윈도우11_설치-네트워크_연결_설정_진행불가.png)
_Windows 11 installation - Cannot proceed with ‘Network Connection’ settings_

On that screen, press `Shift + F10` to open a Command Prompt window. Then enter `OOBE\BYPASSNRO`.  

Afterwards, it will automatically reboot, and you can skip the ‘network connection’ settings afterwards.  

```
OOBE\BYPASSNRO
```
Once Windows installation is complete, install the wireless LAN driver saved on the USB stick. Then, visit [Lenovo driver site](https://pcsupport.lenovo.com/kr/ko/products/laptops-and-netbooks/3-series/ideapad-3-15aba7/downloads){:target="_blank"} and install the remaining drivers that could not be installed. do.  
## memory purchase
As shown below, **Lenovo Slim3 15ABA7 R5**is equipped with 8GB of DDR4-3200 memory onboard. Therefore, to create a dual-channel memory configuration, purchase 8GB of DDR4-3200 clock memory.  
- **Memory**: 8GB onboard (DDR4-3200) + 1 additional socket

If there is memory in the shopping mall with a clock marked as DDR4-3200 or PC4-25600, you can purchase it.  
## Install memory upgrade
Place the laptop face down on a soft cloth and unscrew all the screws on the back.  
![Lenovo Slim3 15ABA7 R5 - Rear - Remove screws](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면-나사_제거.png)
_Lenovo Slim3 15ABA7 R5 - Rear - Remove screws_

Then, insert an unused plastic card into the gap in the upper right corner to open the back panel. Then, open the back panel by turning it little by little, as if opening a can of canned food. If you insert the plastic card too deeply, the laptop board may be damaged, so insert only a little.  
![Lenovo Slim3 15ABA7 R5 - Opening the back panel](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면판_열기.png)
_Lenovo Slim3 15ABA7 R5 - Opening the back panel_

As explained above, one SATA hard disk and one DDR4 memory can be additionally upgraded.  
![Lenovo Slim3 15ABA7 R5 - Inside](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부.png)
_Lenovo Slim3 15ABA7 R5 - Inside_

Unlike other laptops, **Lenovo Slim3 15ABA7 R5**has a memory slot cover. Remove a small amount of the sticker attached to the cover and lift the cover upward to remove it.  
![Lenovo Slim3 15ABA7 R5 - Internal - Removing the sticker on the memory cover](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_커버의_스티커_분리.png)
_Lenovo Slim3 15ABA7 R5 - Internal - Removing the sticker on the memory cover_

If you have installed the memory, reinstall the memory cover and attach a sticker.  
![Lenovo Slim3 15ABA7 R5 - Internal - Memory installed](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_장착.png)
_Lenovo Slim3 15ABA7 R5 - Internal - Memory installed_

And before closing the back panel, make sure the laptop turns on and boots properly. If booting does not occur due to poor memory contact, the back panel must be opened again, so check whether the boot is normal without closing the back panel.  

Place something like a cigarette case on the hinge of the laptop to prevent the fan from spinning, then turn on the laptop. If the memory is not recognized properly or does not boot, try extracting the memory and reinstalling it.  
![Lenovo Slim3 15ABA7 R5 - Secure bottom space to check new memory operation](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-신규_메모리_동작_확인을_위해_하단_공간_확보.png)
_Lenovo Slim3 15ABA7 R5 - Secure bottom space to check new memory operation_

If the laptop operates normally, close the back panel and retighten the screws that were loosened.  
## Check memory dual channel recognition
Install [CPU-Z](https://www.cpuid.com/softwares/cpu-z.html){:target="_blank"} or [HWiNFO64](https://www.hwinfo.com/download/){:target="_blank"} or download the portable version. .  

In CPU-Z, if the memory operates as [Dual Channel](https://en.wikipedia.org/wiki/Multi-channel_memory_architecture){:target="_blank"}, Channel is usually displayed as `Dual`, **Lenovo Slim3 15ABA7 R5**is displayed as `2 x 64-bit`.  

I`m not sure if this is an error or a difference in the latest version of CPU-Z.  
![Lenovo Slim3 15ABA7 R5 - CPU-Z - Memory](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-cpu-z-메모리.png)
_Lenovo Slim3 15ABA7 R5 - CPU-Z - Memory_

However, in HWiNFO64, it was displayed correctly as `Dual-Channel`.  
![Lenovo Slim3 15ABA7 R5 - HWiNFO64 - System Summary - Memory](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-hwinfo64-시스템_요약-메모리.png)
_Lenovo Slim3 15ABA7 R5 - HWiNFO64 - System Summary - Memory_

