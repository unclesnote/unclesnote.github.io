---
title:  在 Ubuntu 20.04 中使用 ibus-hangul 配置韩语-英语转换密钥
image:
  path: /assets/images/231104211615/zh-thumb-unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04.png
  alt: 在 Ubuntu 20.04 中使用 ibus-hangul 配置韩语-英语转换密钥
images: ["/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-search_region_and_run_region_lanugages.png", "/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-add_korean_hangul_input_source.png", "/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-korean-english_conversion_key_setting.png"]
categories: [乌班图, 常见的]
tags: [伊布尚古尔, 乌班图, 常见的, 键盘]
description:  如果您使用 Ubuntu 进行软件开发，您将主要使用英文输入。然而，在某些情况下，可能需要在 GNOME GUI 中输入韩语。因此，由于默认设置仅允许英语输入，因此我们将使用`ibus-hangul`插件来设置韩语输入。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-04 21:16:15 +0900
ro_id: 231104211615
ro_name: configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04
ro_ref: 231104211615/configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04
lang: zh
---
如果您使用 Ubuntu 进行软件开发，您将主要使用英文输入。然而，在某些情况下，可能需要在 GNOME GUI 中输入韩语。  

因此，由于默认设置仅允许英语输入，因此我们将使用`ibus-hangul`插件来设置韩语输入。  
## 伊布韩文
`ibus-hangul` 是一个在 Linux 或 Ubuntu 上支持朝鲜文输入法的插件。 `ibus`代表`输入总线`。 Ubuntu 已经支持韩文输入，但我们将升级并使用`ibus-hangul`来优化韩文输入。  

更新 apt 的存储库并升级 `ibus-hangul` 插件。当我安装它时，插件大小为 615 MB。升级需要一些时间。  

```shell
sudo apt update
sudo apt upgrade ibus-hangul
```
## 韩语输入设置
首先，在应用程序中搜索`region`关键字，然后找到并运行`Region &amp; Language`设置。  

![搜索`region`并运行`Region &amp; Languages`](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-search_region_and_run_region_lanugages.png)
_搜索`region`并运行`Region &amp; Languages`_

然后，在`区域和语言`选项卡中添加`输入源`。搜索`韩语`并添加`韩语(韩文)`。  

![添加`韩语（韩文）`输入源](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-add_korean_hangul_input_source.png)
_添加`韩语（韩文）`输入源_

在设置新添加的输入源之前，请删除现有的`英语(美国)`。这是为了防止与新添加的`韩国(韩文)`输入源发生冲突。并且新增的输入源已经包含英文输入功能。  

单击`韩国(韩文)`输入源上的齿轮图标以打开`IBusHangle 设置`。  

![韩英转换键设置](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-korean-english_conversion_key_setting.png)
_韩英转换键设置_

然后，在`Etc`部分激活`以韩文模式启动`。作为参考，当您启动 Ubuntu 时，如果您希望 GNOME GUI 中的第一个输入模式为韩语，请启用它。  

并且，删除默认添加的所有`Hangul Toggle Key`。无法保证这与您使用的实际键盘上的语言切换键相匹配。  

单击`添加`按钮，当新窗口打开时，按键盘上的语言切换键。就我的键盘而言，`Alt_R`被指定为语言更改键。  
