---
title:  Windows ツールの代わりに Ubuntu に不可欠な代替ソフトウェア
image:
  path: /assets/images/231028002032/ja-thumb-unclesnote-essential_software_to_use_on_ubuntu_os.png
  alt: Windows ツールの代わりに Ubuntu に不可欠な代替ソフトウェア
images: ["/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-ubuntu_softwares.svg", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krusader.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-gwenview.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-gwenview-check_low_resource_usage_mode_for_disabling_thumbnail_cache.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-photopea-www.photopea.com.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-photopea-limited_ads_on_right_panel_and_adblock_extension_on_the_chrome_web_browser.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krita.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krita-download_linux_appimage.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-easystroke-preferences.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-easystroke-download_in_ubuntu_software.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-ubuntu_software-bleachbit.png", "/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-bleachbit.png"]
categories: [Ubuntu, ツール]
tags: [クルセイダー, グウェンビュー, フォトピー, クリタ, イージーストローク, 画像ビューア, 画像エディタ, ファイルブラウザ, マウスマクロ, Ubuntu, ツール, ブリーチビット, フリースペース]
description:  Ubuntu OS 特有の利点を理由に Ubuntu を使用している場合は、Windows 環境で使用していたものと同様のソフトウェアを Ubuntu 環境で使用できるようにしようとします。そこで、ファイルブラウザ、画像ビューア/エディタ、生産性向上ツールなど、Ubuntuを使用する際に一般的に使用すると良いソフトウ
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-28 00:20:32 +0900
ro_id: 231028002032
ro_name: essential_software_to_use_on_ubuntu_os
ro_ref: 231028002032/essential_software_to_use_on_ubuntu_os
lang: ja
---
Ubuntu OS 特有の利点を理由に Ubuntu を使用している場合は、Windows 環境で使用していたものと同様のソフトウェアを Ubuntu 環境で使用できるようにしようとします。そこで、ファイルブラウザ、画像ビューア/エディタ、生産性向上ツールなど、Ubuntuを使用する際に一般的に使用すると良いソフトウェアをいくつか紹介します。  
![Ubuntu ソフトウェア](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-ubuntu_softwares.svg)
_Ubuntu ソフトウェア_

## ファイルブラウザ
### クルセイダー
Windows 環境で Q-Dir または [Total Commander](https://www.ghisler.com/download.htm){:target="_blank"} を使用した経験がある場合は、[Krusader](https://krusader.org){:target="_blank"} で分割の経験を提供します。ウィンドウとマルチタブのファイルブラウジング。  
![クルセイダー](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krusader.png)
_クルセイダー_

インストール方法はとても簡単です。 aptを使用してインストールできます。  

```shell
sudo apt update
sudo apt install krusader
```
## 画像ビューア/エディタ
### グウェンビュー
[GwenView](https://github.com/KDE/gwenview){:target="_blank"} は、私がこれまで使用した中で最高の Ubuntu 画像ビューアです。より良い画像ビューアを見つけたら更新します。  
![グウェンビュー](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-gwenview.png)
_グウェンビュー_

ただし、画像ファイルを頻繁に更新すると、GwenView リストのサムネイルの表示と実際の画像が異なる場合があります。したがって、サムネイル キャッシュの使用を無効にすることをお勧めします。  

`設定 > Gwenview の構成 > 詳細`で、`低リソース使用モード`にチェックを入れます。  
![GwenView - サムネイル キャッシュを無効にするために`低リソース使用モード`をチェックします](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-gwenview-check_low_resource_usage_mode_for_disabling_thumbnail_cache.png)
_GwenView - サムネイル キャッシュを無効にするために`低リソース使用モード`をチェックします_

GwenView は apt を使用して簡単にインストールできます。  

```shell
sudo apt install gwenview -y
```
### フォトピー
Photoshop に慣れている人にとって、最良の代替手段は [Photopia](https://www.photopea.com){:target="_blank"} のようです。 Photopia は、Photoshop に最も似たインターフェイスを提供する Web アプリです。  
![Photopea - www.photopea.com](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-photopea-www.photopea.com.png)
_Photopea - www.photopea.com_

Photopia に似た Web サイトはありますが、Photopia の利点は、広告ブロッカーが Web 上の広告をブロックできること、それが収益モデルであることです。 Chrome ブラウザを使用している場合は、Web ストアで`AdBlock`を検索してインストールしてください。  

`AdBlock`を使用しなくても、右側パネルに表示される広告の量は他のサイトに比べて少ないので、あまり目立ちません。  
![Photopea - 右側のパネルに限定された広告と Chrome Web ブラウザの AdBlock 拡張機能](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-photopea-limited_ads_on_right_panel_and_adblock_extension_on_the_chrome_web_browser.png)
_Photopea - 右側のパネルに限定された広告と Chrome Web ブラウザの AdBlock 拡張機能_

### クリタ
Photopia とは異なるオフライン画像エディターを探している場合は、Krita が代替となるかもしれません。ただし、Photoshop に慣れているユーザーにとっては、不慣れに感じるかもしれません。 GUI インターフェイスは Photoshop に似ていますが、ショートカットとツールは多くの点で異なります。  
![クリタ](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krita.png)
_クリタ_

Photoshop と完全に似ているわけではありませんが、画像を編集したり描画したりする必要があり、完全なソフトウェアを探している場合は、Krita が良い選択肢になる可能性があります。  

Krita は、ソフトウェアをアプリ イメージの形式で配布します。以下の Krita サイトにアクセスし、Linux 用のアプリ イメージをダウンロードします。  
- [https://krita.org/en/download/krita-desktop](https://krita.org/en/download/krita-desktop)

![Krita - Linux AppImage をダウンロード](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-krita-download_linux_appimage.png)
_Krita - Linux AppImage をダウンロード_

ダウンロードしたKritaアプリイメージに実行許可を与えて実行します。  

```shell
cd ~/Downloads
chmod 777 *.appimage
```
## 生産性
### イージーストロークジェスチャー(マウスジェスチャーマクロ)
Windows 上で [Strokeit](https://www.tcbmi.com/strokeit){:target="_blank"} マウス ジェスチャ マクロ ソフトウェアを使用した経験がある場合は、`Easysteroid Gesture` が Ubuntu の最良の代替手段となります。  

`マウスの右ボタン`によるジェスチャを描画したい場合は、以下の設定が必要です。実際、起動時に自動的に実行することは必須のオプションです。  

Easythrough Preferences タブで、Behavior を`Button 3`に設定し、Appearance で自動的に実行されるように設定します。  

マウスジェスチャアクションは`アクション`タブで追加できます。  
![イージーストローク - 設定](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-easystroke-preferences.png)
_イージーストローク - 設定_

Ubuntu ソフトウェア アプリで検索すると簡単にインストールできます。  
![Easythrough - Ubuntu ソフトウェアでダウンロード](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-easystroke-download_in_ubuntu_software.png)
_Easythrough - Ubuntu ソフトウェアでダウンロード_

以下は、私がマウスジェスチャーにマッピングして使用しているいくつかのショートカットキーです。  

|アプリ|ショートカット|説明|
| ------- | ---------------- | ----------------- |
|一般|Ctrl + ホーム|ページの先頭に移動|
|一般|Ctrl + End|ページの一番下に移動|
|VSコード|Ctrl + Alt + -|戻る|
|VSコード|Ctrl + Shift + -|前進する|

## システム
### BleachBit(FreeSpace 用クリーナー)
[BleachBit](https://www.bleachbit.org/features){:target="_blank"}は、不要なファイルを削除して空き容量を増やす便利なソフトウェアです。 Linuxのほか、WindowsやMac OSなどさまざまなOSに対応しています。  

Ubuntu ソフトウェア アプリケーションで`bleachbit`を検索すると、簡単にインストールできます。  
![Ubuntu ソフトウェア - BleachBit](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-ubuntu_software-bleachbit.png)
_Ubuntu ソフトウェア - BleachBit_

整理したい項目にチェックを入れて`クリーン`ボタンを押すと、不要なファイルが自動的に削除され、空き容量が確保されます。ただし、`APT`項目と`journald`項目を整理するときは注意が必要です。これにより、Ubuntu システムまたはパッケージの依存関係が壊れる可能性があります。  
![ブリーチビット](/assets/images/231028002032/unclesnote-essential_software_to_use_on_ubuntu_os-bleachbit.png)
_ブリーチビット_

