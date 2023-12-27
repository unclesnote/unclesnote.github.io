---
title:  Windows 10 の複数のディスプレイ構成でディスプレイが非アクティブになる問題
image:
  path: /assets/images/231214163036/ja-thumb-unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10.png
  alt: Windows 10 の複数のディスプレイ構成でディスプレイが非アクティブになる問題
images: ["/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-windows_+_r_enter_regedit.png", "/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-registry_editor-remove_the_configuration_and_connectivity_folders_in_the_graphicsdrivers_folder.png"]
categories: [コンピューター, トラブルシューティング]
tags: [コンピューター, トラブルシューティング]
description:  私は職場と自宅の間で 1 台のラップトップを使用するユーザーです。職場と自宅の両方でラップトップに 2 つ以上のディスプレイを接続して使用していますが、一部のディスプレイだけがラップトップに認識され、ディスプレイ設定に入るときに非アクティブとして表示されることがあります。おそらく Windows は各環境に適したディ
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-14 16:30:36 +0900
ro_id: 231214163036
ro_name: display_inactivity_issues_in_multiple_display_configurations_in_windows_10
ro_ref: 231214163036/display_inactivity_issues_in_multiple_display_configurations_in_windows_10
lang: ja
---
私は職場と自宅の間で 1 台のラップトップを使用するユーザーです。職場と自宅の両方でラップトップに 2 つ以上のディスプレイを接続して使用していますが、一部のディスプレイだけがラップトップに認識され、ディスプレイ設定に入るときに非アクティブとして表示されることがあります。  

おそらく Windows は各環境に適したディスプレイ設定をプリセットとしてレジストリに保存して管理しているのだと思いますが、この設定のひねりが原因でこの問題が発生する場合があるようです。  

この問題を解決するために私が見つけた方法は、Windows ディスプレイ構成レジストリ値を削除して初期化することです。結論から言うと、マルチディスプレイ環境を再度セットアップする必要があります。その方法を説明します。  
## 1. Windows レジストリ エディタを開きます
`Windows + R`を使用して`ファイル名を指定して実行`ダイアログに`regedit`と入力するか、`スタート`メニューで`regedit.exe`を検索して`レジストリ エディタ`を実行します。  
![Windows + R > `regedit`と入力](/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-windows_+_r_enter_regedit.png)
_Windows + R > `regedit`と入力_

## 2.レジストリエディタで表示プリセット値を削除する
レジストリ エディターで、アドレス バーに以下のパスを入力するか、ツリー内のパスに移動します。  

```
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers
```
右クリックメニューから`GraphicsDrivers`フォルダ内の以下の２つのフォルダを削除します。  
- Configuration
- Connectivity

![レジストリ エディタ - `GraphicsDrivers`フォルダ内の`Configuration`フォルダと`Connectivity`フォルダを削除します。](/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-registry_editor-remove_the_configuration_and_connectivity_folders_in_the_graphicsdrivers_folder.png)
_レジストリ エディタ - `GraphicsDrivers`フォルダ内の`Configuration`フォルダと`Connectivity`フォルダを削除します。_

## 3. Windowsを再起動します。
Windows を再起動します。再起動が完了すると、Windows の観点からは、ディスプレイが新しく認識されたディスプレイになります。  

そのため、ディスプレイ設定でディスプレイの位置と向きを再設定する必要があります。要するに、これは非常に迷惑です。心よりお悔やみを申し上げます。  
