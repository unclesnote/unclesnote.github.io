---
title:  Configuring Korean-English Conversion Key with ibus-hangul in Ubuntu 20.04
image:
  path: /assets/images/231104211615/en-thumb-unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04.png
  alt: Configuring Korean-English Conversion Key with ibus-hangul in Ubuntu 20.04
images: ["/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-search_region_and_run_region_lanugages.png", "/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-add_korean_hangul_input_source.png", "/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-korean-english_conversion_key_setting.png"]
categories: [Ubuntu, Common]
tags: [ibushangul, Ubuntu, Common, Keyboards]
description:  If you use Ubuntu for software development purposes, you will mostly type in English. However, in some cases, it may be necessary to input Korean into the
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-04 21:16:15 +0900
ro_id: 231104211615
ro_name: configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04
ro_ref: 231104211615/configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04
lang: en
---
If you use Ubuntu for software development purposes, you will mostly type in English. However, in some cases, it may be necessary to input Korean into the GNOME GUI.  

So, since the default settings only allow English input, we will use the `ibus-hangul` plugin to set up Korean input.  
## ibus-hangul
`ibus-hangul` is a plugin that supports the Hangul input method on Linux or Ubuntu. `ibus` stands for `Input Bus`. Ubuntu already supports Hangul input, but we will upgrade and use `ibus-hangul` for optimized Hangul input.  

Update apt's repository and upgrade the `ibus-hangul` plugin. When I installed it, the plug-in size was 615 MB. It takes some time to upgrade.  

```shell
sudo apt update
sudo apt upgrade ibus-hangul
```
## Korean input settings
First, search for the `region` keyword in the applications, then find and run the `Region & Language` setting.  
![Search `region` and run `Region & Lanugages`](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-search_region_and_run_region_lanugages.png)
_Search `region` and run `Region & Lanugages`_

Then, add `Input Source` in the `Region & Language` tab. Search for `korean` and add `Korean (Hangul)`.  
![Add `Korean (Hangul)` Input Source](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-add_korean_hangul_input_source.png)
_Add `Korean (Hangul)` Input Source_

Before setting the newly added input source, remove the existing `English (US)`. This is to prevent conflict with the newly added `Korea (Hangul)` input source. And the added input source already includes an English input function.  

Click the gear icon on the `Korea (Hangul)` input source to open `IBusHangle Setup`.  
![Korean-English conversion key setting](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-korean-english_conversion_key_setting.png)
_Korean-English conversion key setting_

Then, activate `Start in Hangul mode` in the `Etc` section. For reference, when you boot up Ubuntu, if you want the first input mode in the GNOME GUI to be Korean, enable it.  

And, remove all `Hangul Toggle Key` added by default. There is no guarantee that this will match the language switch key on the actual keyboard you are using.  

Click the `Add` button, and when a new window opens, press the language switch key on your keyboard. In the case of my keyboard, `Alt_R` was assigned as the language change key.  
