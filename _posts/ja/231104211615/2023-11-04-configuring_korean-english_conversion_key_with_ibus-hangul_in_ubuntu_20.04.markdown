---
title:  Ubuntu 20.04 の ibus-hangul を使用した韓国語 - 英語変換キーの構成
image:
  path: /assets/images/231104211615/ja-thumb-unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04.png
  alt: Ubuntu 20.04 の ibus-hangul を使用した韓国語 - 英語変換キーの構成
images: ["/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-search_region_and_run_region_lanugages.png", "/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-add_korean_hangul_input_source.png", "/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-korean-english_conversion_key_setting.png"]
categories: [Ubuntu, 一般]
tags: [イブサングル, Ubuntu, 一般, キーボード]
description:  ソフトウェア開発目的で Ubuntu を使用する場合、ほとんどの場合英語で入力することになります。ただし、場合によっては、GNOME GUI に韓国語を入力する必要がある場合があります。そこで、デフォルト設定では英語入力しか許可されていないため、`ibus-hangul`プラグインを使用して韓国語入力を設定します。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-04 21:16:15 +0900
ro_id: 231104211615
ro_name: configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04
ro_ref: 231104211615/configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04
lang: ja
---
ソフトウェア開発目的で Ubuntu を使用する場合、ほとんどの場合英語で入力することになります。ただし、場合によっては、GNOME GUI に韓国語を入力する必要がある場合があります。  

そこで、デフォルト設定では英語入力しか許可されていないため、`ibus-hangul`プラグインを使用して韓国語入力を設定します。  
## ibus-ハングル
`ibus-hangul` は、Linux または Ubuntu 上でハングル入力方法をサポートするプラグインです。 `ibus`は`入力バス`の略です。 Ubuntu はすでにハングル入力をサポートしていますが、最適化されたハングル入力のためにアップグレードして`ibus-hangul`を使用します。  

apt のリポジトリを更新し、`ibus-hangul`プラグインをアップグレードします。インストールしたときのプラグインのサイズは 615 MB でした。アップグレードには時間がかかります。  

```shell
sudo apt update
sudo apt upgrade ibus-hangul
```
## 韓国語入力設定
まず、アプリケーションで`地域`キーワードを検索し、`地域と言語`設定を見つけて実行します。  

![`地域`を検索し、`地域と言語`を実行します。](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-search_region_and_run_region_lanugages.png)
_`地域`を検索し、`地域と言語`を実行します。_

次に、`地域と言語`タブに`入力ソース`を追加します。 `韓国語`を検索し、`韓国語 (ハングル)`を追加します。  

![`韓国語（ハングル）`入力ソースを追加](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-add_korean_hangul_input_source.png)
_`韓国語（ハングル）`入力ソースを追加_

新しく追加した入力ソースを設定する前に、既存の`English (US)`を削除してください。これは、新たに追加された`韓国語(ハングル)`入力ソースとの競合を防ぐためです。また、追加された入力ソースには、すでに英語入力機能が含まれています。  

`韓国語 (ハングル)`入力ソースの歯車アイコンをクリックして、`IBusHangle Setup`を開きます。  

![韓国語-英語変換キー設定](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-korean-english_conversion_key_setting.png)
_韓国語-英語変換キー設定_

次に、`その他`セクションの`ハングルモードで開始`を有効にします。参考までに、Ubuntu を起動するときに、GNOME GUI の最初の入力モードを韓国語にしたい場合は、それを有効にします。  

そして、デフォルトで追加されている`ハングル切り替えキー`をすべて削除します。これが実際に使用しているキーボードの言語切り替えキーと一致するという保証はありません。  

`追加`ボタンをクリックし、新しいウィンドウが開いたら、キーボードの言語切り替えキーを押します。私のキーボードの場合、言語変更キーとして`Alt_R`が割り当てられていました。  
