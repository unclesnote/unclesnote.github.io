---
title:  Jekyll Windows テスト用の VirtualBox ポート転送方法
image:
  path: /assets/images/231024185205/ja-thumb-jekyll_port_forwarding-thumb.png
  alt: Jekyll Windows テスト用の VirtualBox ポート転送方法
images: ["/assets/images/231024185205/jekyll_port_forwarding-vm-port-forwarding.png"]
categories: [GitHub ページ, ジキル]
tags: [ジキル, バーチャルボックス, ポートフォワーディング, GitHubページ, GitHub]
description:  私の場合、Virtual Box の Ubuntu VM 上で Jekyll(GitHub Pages) をビルドしてテストし、それを GitHub にプッシュします。ただし、Ubuntu VM での Firefox などのブラウザーのルック アンド フィールは、実際の X86 Windows のルック アンド フィールとは若干異なります。そこで、X86 Windows ブラウザ上で Jekyll をテストするための Virtual Box のポート転送方法を説明したいと思います。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-24 18:52:05 +0900
ro_id: 231024185205
ro_name: jekyll__github_pages_virtual_box_port_forwarding_method_for_windows_testing
ro_ref: 231024185205/jekyll__github_pages_virtual_box_port_forwarding_method_for_windows_testing
lang: ja
---
私の場合、Virtual Box の Ubuntu VM 上で Jekyll(GitHub Pages) をビルドしてテストし、それを GitHub にプッシュします。ただし、Ubuntu VM での Firefox などのブラウザーのルック アンド フィールは、実際の X86 Windows のルック アンド フィールとは若干異なります。そこで、X86 Windows ブラウザ上で Jekyll をテストするための Virtual Box のポート転送方法を説明したいと思います。  
## Ubuntu VM 上でローカルに Jekyll を実行する
まず、Ubuntu VM の`ifconfig`を使用してネットワーク インターフェイスの IP アドレスを確認します。私の場合、IP アドレスは`10.0.2.15`です。  

```
$ ifconfig
..
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::e1f0:30d0:1e9b:bafc  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:07:7a:96  txqueuelen 1000  (Ethernet)
        RX packets 9737  bytes 12163823 (12.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 3811  bytes 1289032 (1.2 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
...
```
Jekyll をテストするには、Jekyll を実行し、上記で確認した IP アドレスを`--host`オプションを使用して入力します。  

```shell
$ bundle exec jekyll serve --host 10.0.2.15
Configuration file: /home/myaccount/my_jekyll_root/_config.yml
 Theme Config file: /home/myaccount/my_jekyll_root/_config.yml
            Source: /home/myaccount/my_jekyll_root
       Destination: /home/myaccount/my_jekyll_root/_site
 Incremental build: disabled. Enable with --incremental
      Generating... 
                    done in 1.483 seconds.
 Auto-regeneration: enabled for '/home/myaccount/my_jekyll_root'
    Server address: http://10.0.2.15:4000/
  Server running... press ctrl-c to stop.
```
## Virtual Box Manager で Ubuntu VM のポート転送を設定する
Virtual Box Manager の Ubuntu VM のネットワーク設定で、次のように入力してポート転送を追加します。  
`ゲスト IP`アドレスは、Ubuntu VM 上で確認された IP アドレスです。  
- **名前** : (希望の名前)
- **プロトコル** : TCP
- **ホストIP** : 127.0.0.1
- **ゲスト IP** : 10.0.2.15 (上記で確認された Ubuntu VM の IP アドレス)
- **ゲストポート** : 4000

![VirtualBox Manager - ポート転送ルール](/assets/images/231024185205/jekyll_port_forwarding-vm-port-forwarding.png)  

VirtualBox Manager - ポート転送ルール
{: style="color:gray; font-size: 80%; text-align: center;"}

これで、X86 Windows ブラウザで `127.0.0.1:4000` に接続して Jekyll をテストできるようになりました。  
