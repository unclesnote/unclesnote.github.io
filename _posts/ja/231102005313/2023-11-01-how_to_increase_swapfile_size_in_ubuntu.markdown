---
title:  Ubuntuでスワップファイルのサイズを増やす方法
image:
  path: /assets/images/231102005313/ja-thumb-unclesnote-how_to_increase_swapfile_size_in_ubuntu.png
  alt: Ubuntuでスワップファイルのサイズを増やす方法
images: ["/assets/images/231102005313/unclesnote-how_to_increase_swapfile_size_in_ubuntu-applications_menu_system_monitor.png"]
categories: [Ubuntu, 一般]
tags: [ファタブ, スワップ, スワップファイル, Ubuntu, 一般]
description:  十分な物理メモリがない状態で Ubuntu マシンを長時間実行したままにしたり、大規模なプラットフォームや BSP をコンパイルして構築したりすると、パフォーマンスが低下したり、エラーが発生したりすることがあります。そのため、Linux ベースの OS は、物理メモリが不足した場合にスワップファイルを作成し、ハードデ
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 00:53:13 +0900
ro_id: 231102005313
ro_name: how_to_increase_swapfile_size_in_ubuntu
ro_ref: 231102005313/how_to_increase_swapfile_size_in_ubuntu
lang: ja
---
十分な物理メモリがない状態で Ubuntu マシンを長時間実行したままにしたり、大規模なプラットフォームや BSP をコンパイルしてビルドしたりすると、パフォーマンスが低下したり、エラーが発生したりすることがあります。  

そのため、Linux ベースの OS は、物理メモリが不足した場合にスワップファイルを作成し、ハードディスク上のファイルをメモリとして使用します。これはスワップ ファイルと呼ばれ、Windows 環境の仮想メモリに似ています。  

それでは、Ubuntu 20.04でのスワップファイルの作成と適用方法を説明したいと思います。  
## チェックスワップ
私の Ubuntu 環境でのスワップ ステータスを確認するには、`free -m`コマンドを使用します。そして、システムの`root`に`swapfile`があるかどうかを確認してください。スワップ ファイルはルート パスに作成するのが一般的です。  

私の場合、2 GB のスワップを使用しており、スワップファイルはルート パスにあります。  

````bash
$ free -m
              total        used        free      shared  buff/cache   available
Mem:           4913        1306        2306           8        1300        3359
Swap:          2048           0        2048
$ ls -la /
total 8388712
...
-rw-------   1 root root   2048934592 Jul 24 17:54 swapfile
...
````
## スワップファイルの作成
既存の 2GB スワップファイルを削除し、新しい 5GB スワップファイルを作成します。  

まず、スワップ機能をオフにして、既に使用されている 2GB のスワップ ファイルを削除します。  

```shell
sudo swapoff -v /swapfile
sudo rm /swapfile
```
次に、ルートに 5GB のスワップファイルを作成し、ファイル権限を 600 に割り当てます。  

```shell
sudo fallocate -l 5G /swapfile
sudo chmod 600 /swapfile 
```
最後に、新しく作成したファイルとのスワップを有効にします。  

```bash
sudo mkswap /swapfile
sudo swapon /swapfile
```
以下は、上記のコマンドを実行した方法です。  

```bash
$ sudo swapoff -v /swapfile
[sudo] password for bull: 
swapoff /swapfile
$ sudo rm /swapfile
$ sudo fallocate -l 5G /swapfile
$ ls -l /
total 5242976
...
-rw-r--r--   1 root root   5368709120 Aug 17 14:11 swapfile
...
$ sudo chmod 600 /swapfile 
$ sudo mkswap /swapfile
Setting up swapspace version 1, size = 5 GiB (5368705024 bytes)
no label, UUID=747f641b-70cc-449c-b719-e54154ad8194
$ sudo swapon /swapfile
```
## スワップファイルの登録
さて、最後に、Ubuntu が起動するたびにスワップファイルをロードするように Ubuntu を設定します。  

次に、`/etc/fstab`を開きます。  

```shell
sudo vi /etc/fstab    
```
そして、以下の行を追加します。すでに設定されている場合は追加する必要はありません。  

```shell
/swapfile              none            swap    sw              0       0
```
## リブート
まず再起動してください。再起動後、上記で生成されたスワップファイルをシステムモニターで確認できます。  
![`アプリケーション`メニュー > システムモニター](/assets/images/231102005313/unclesnote-how_to_increase_swapfile_size_in_ubuntu-applications_menu_system_monitor.png)
_`アプリケーション`メニュー > システムモニター_

