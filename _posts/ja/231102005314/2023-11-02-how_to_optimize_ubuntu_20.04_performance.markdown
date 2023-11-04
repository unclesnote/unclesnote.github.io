---
title:  Ubuntu 20.04のパフォーマンスを最適化する方法
image:
  path: /assets/images/231102005314/ja-thumb-unclesnote-how_to_optimize_ubuntu_20.04_performance.png
  alt: Ubuntu 20.04のパフォーマンスを最適化する方法
images: ["/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-application_menu_search_dock_appearance_settings.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-settings_appearance_resize_icon_size.png"]
categories: [Ubuntu, 一般]
tags: [Ubuntuアニメーション, ドックアイコンのサイズ, スワップファイル, スワップ, Ubuntu, 一般]
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

ドック アイコンのサイズ - アプリケーション メニュー > `ドック`の検索 > 外観設定
{: style="color:gray; font-size: 80%; text-align: center;"}

次に、`アイコン サイズ`を小さくして、見栄えの良いサイズに設定します。  
![ドックアイコンのサイズ - [設定] > [外観] > [アイコン サイズ] のサイズ変更](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-settings_appearance_resize_icon_size.png)  

ドックアイコンのサイズ - [設定] > [外観] > [アイコン サイズ] のサイズ変更
{: style="color:gray; font-size: 80%; text-align: center;"}

## スワップサイズを増やす
Virtual Box にインストールされた Ubuntu を使用している場合、仮想マシンは Windows コンピューターと共有されるため、8GB 未満のメモリが割り当てられる可能性があります。 Ubuntu をカジュアルに使用する場合は問題にならないかもしれませんが、大規模なプラットフォーム、BSP、またはソフトウェアをコンパイルしようとすると、メモリ不足がコンパイルの失敗につながる可能性があります。これは、スワップ サイズを増やすことで解決できます。  

ハードディスク容量はメモリ容量よりも安いので、スワップを増やしましょう。以下の記事をご覧ください。  
