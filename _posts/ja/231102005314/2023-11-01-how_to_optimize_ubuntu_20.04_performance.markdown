---
title:  Ubuntu 20.04のパフォーマンスを最適化する方法
image:
  path: /assets/images/231102005314/ja-thumb-unclesnote-how_to_optimize_ubuntu_20.04_performance.png
  alt: Ubuntu 20.04のパフォーマンスを最適化する方法
images: ["/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-application_menu_search_dock_appearance_settings.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-settings_appearance_resize_icon_size.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-warning_popup_for_low_disk_space_on_filessystem_root.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-ubuntu_software-bleachbit.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-bleachbit.png"]
categories: [Ubuntu, 一般]
tags: [Ubuntuアニメーション, ドックアイコンのサイズ, スワップファイル, スワップ, Ubuntu, 一般, ブリーチビット]
description:  Ubuntu OSがインストールされたPCをメインコンピュータとして使用している場合を除き、ハードウェア仕様が低いPCを使用しているか、Oracle VM VirtualBoxにUbuntuをインストールしている可能性があります。主に SSH を使用してリモート接続する場合は大きな影響はありませんが、GNOME で 
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 00:53:14 +0900
ro_id: 231102005314
ro_name: how_to_optimize_ubuntu_20.04_performance
ro_ref: 231102005314/how_to_optimize_ubuntu_20.04_performance
lang: ja
---
Ubuntu OSがインストールされたPCをメインコンピュータとして使用している場合を除き、ハードウェア仕様が低いPCを使用しているか、Oracle VM VirtualBoxにUbuntuをインストールしている可能性があります。  

主に SSH を使用してリモート接続する場合は大きな影響はありませんが、GNOME で UI を頻繁に操作する場合は、パフォーマンスが低下する可能性があります。そこで、Ubuntu のインストールおよび構成時にパフォーマンスを最適化するためのヒントをいくつか紹介します。  
## アニメーションをオフにする
Virtual Box またはローエンド PC で Ubuntu を使用している場合、リソースが限られているため、アニメーションによって OS のパフォーマンスが低下する可能性があります。以下は、Ubuntu GNOME GUI でアニメーションをオフまたはオンにする方法です。ターミナルでコマンドを実行できます。  

以下は、Ubuntu アニメーションをオフにして設定を確認するためのターミナル コマンドです。  

```shell
$ gsettings set org.gnome.desktop.interface enable-animations false
$ gsettings get org.gnome.desktop.interface enable-animations
false
```
以下は、Ubuntu アニメーションを有効にするターミナル コマンドです。違いは、コマンドの最後の引数が`false`から`true`に変更されていることです。  

```shell
$ gsettings set org.gnome.desktop.interface enable-animations true
$ gsettings get org.gnome.desktop.interface enable-animations
true
```
## ドックアイコンのサイズ
解像度が制限されたディスプレイを使用している場合、Dock のデフォルトのアイコン サイズでは、一度に多くのアイコンを登録したり操作したりすることが制限される可能性があります。そのため、Dock アイコンのサイズを小さく設定できます。  

まず、`アプリケーションメニュー`でドックを検索し、`外観`設定を開きます。  
![ドック アイコンのサイズ - アプリケーション メニュー > `ドック`の検索 > 外観設定](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-application_menu_search_dock_appearance_settings.png)
_ドック アイコンのサイズ - アプリケーション メニュー > `ドック`の検索 > 外観設定_

次に、`アイコン サイズ`を小さくして、見栄えの良いサイズに設定します。  
![ドックアイコンのサイズ - [設定] > [外観] > [アイコン サイズ] のサイズ変更](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-settings_appearance_resize_icon_size.png)
_ドックアイコンのサイズ - [設定] > [外観] > [アイコン サイズ] のサイズ変更_

## スワップサイズを増やす
Virtual Box にインストールされた Ubuntu を使用している場合、仮想マシンは Windows コンピューターと共有されるため、8GB 未満のメモリが割り当てられる可能性があります。 Ubuntu をカジュアルに使用する場合は問題にならないかもしれませんが、大規模なプラットフォーム、BSP、またはソフトウェアをコンパイルしようとすると、メモリ不足がコンパイルの失敗につながる可能性があります。これは、スワップ サイズを増やすことで解決できます。  

ハードディスク容量はメモリ容量よりも安いので、スワップを増やしましょう。以下の記事をご覧ください。  
- https://unclesnote.com/en/231102005313/how_to_increase_swapfile_size_in_ubuntu

## ディスク上の空き領域を確保する
仮想マシンがインストールされた Ubuntu を使用していて、イメージ サイズが十分に大きくない場合は、次のような警告ポップアップが表示される場合があります。これは、システム内の一時ファイルまたはログ ファイルに蓄積された場合に発生する可能性があります。空き容量がゼロに収束すると、Ubuntu VM が起動しなくなる可能性があります。  
![ファイルシステムルートのディスク容量不足に関する警告ポップアップ](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-warning_popup_for_low_disk_space_on_filessystem_root.png)
_ファイルシステムルートのディスク容量不足に関する警告ポップアップ_

一時ファイルやシステムログファイルは手動で削除することもできますが、[BleachBit](https://www.bleachbit.org/features){:target="_blank"} アプリケーションを使用すると、GUI 環境でより簡単に管理できます。  

Ubuntu ソフトウェア アプリケーションで`bleachbit`を検索すると、簡単にインストールできます。  
![Ubuntu ソフトウェア - BleachBit](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-ubuntu_software-bleachbit.png)
_Ubuntu ソフトウェア - BleachBit_

整理したい項目にチェックを入れて`クリーン`ボタンを押すと、不要なファイルが自動的に削除され、空き容量が確保されます。ただし、`APT`項目と`journald`項目を整理するときは注意が必要です。これにより、Ubuntu システムまたはパッケージの依存関係が壊れる可能性があります。  
![ブリーチビット](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-bleachbit.png)
_ブリーチビット_

