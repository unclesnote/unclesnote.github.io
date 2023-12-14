---
title:  VirtualBox での Ubuntu 共有フォルダーのセットアップ - Windows ファイル共有
image:
  path: /assets/images/231106120100/ja-thumb-unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange.png
  alt: VirtualBox での Ubuntu 共有フォルダーのセットアップ - Windows ファイル共有
images: ["/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-oracle_vm_virtualbox-add_shared_folder.png", "/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-create_a_test.txt_file_using_the_touch_command_in_ubuntu_vm_and_check_it_in_windows.png"]
categories: [Ubuntu, バーチャルボックス]
tags: [バーチャルボックス, vboxsf, Ubuntu, フォルダー共有]
description:  私の場合、Oracle VM VirtualBox の Ubuntu VM と Windows の間で頻繁にファイル共有が行われます。もちろん、ゲスト追加機能を使用してマウスをドラッグしてファイルを共有することもできますが、それでも不便な場合があります。そこで、Ubuntu VMでWindowsフォルダーを共有する方
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-06 12:01:00 +0900
ro_id: 231106120100
ro_name: seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange
ro_ref: 231106120100/seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange
lang: ja
---
私の場合、Oracle VM VirtualBox の Ubuntu VM と Windows の間で頻繁にファイル共有が行われます。もちろん、ゲスト追加機能を使用してマウスをドラッグしてファイルを共有することもできますが、それでも不便な場合があります。  

そこで、Ubuntu VMでWindowsフォルダーを共有する方法を説明したいと思います。  
## Virtual Boxに共有フォルダーを追加する
Ubuntu VM の設定に移動します。次に、`共有フォルダー`タブに共有するフォルダーを追加します。  

共有フォルダー設定ウィンドウで、`フォルダー パス`に Ubuntu VM と共有するフォルダーを設定します。残りのフォルダと設定項目は以下の通りです。  
- **フォルダー パス** : Ubuntu VM と共有する`Windows`フォルダー パス
- **フォルダー名** : 共有フォルダーのニックネームです。できれば`マウントポイント`のフォルダ名と同じにしてください。
- **マウント ポイント** : `Ubuntu VM`に共有フォルダーをマウントするパス
- ☑ **自動マウント** : 起動時に共有フォルダーを自動的にマウントします。
- ☑ **永続化** : この項目は、Ubuntu VM の実行中に現在の設定を入力すると表示されます。永続的な設定が必要な場合は、チェックを入れます。

![Oracle VM VirtualBox - 共有フォルダーの追加](/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-oracle_vm_virtualbox-add_shared_folder.png)
_Oracle VM VirtualBox - 共有フォルダーの追加_

私の場合、Ubuntu VM の共有フォルダーとして `/home/pooh/_shared` を設定しました。参考までに、私の Ubuntu アカウント名は`pooh`です。  
## Ubuntu VM 上のフォルダーのアクセス許可
Ubuntu VM の実行中に共有フォルダーを追加した場合は、まず Ubuntu VM を再起動します。  

また、`/home/pooh/_shared`と入力しようとすると、権限がない旨のエラーメッセージが表示されます。これは、`vboxsf`グループに含まれるユーザーのみが共有フォルダーにアクセスできるためです。  

```shell
$ ls -l /home/pooh
total 100
...
drwxrwx---  1 root vboxsf     0 11월  6 10:03 _shared
...

$ cd /home/pooh
bash: cd: /home/pooh: Permission denied

```
`gpasswd`コマンドを使用して、Ubuntu アカウントを`vboxsf`グループに追加します。参考までに、私の Ubuntu アカウントの名前は`pooh`です。したがって、`pooh`を Ubuntu アカウント名に置き換えてコマンドを実行します。  

```shell
sudo gpasswd -a pooh vboxsf
```
最も重要な。最後に、Ubuntu VM を再起動します。  
## テスト
Ubuntu VM の再起動が完了したら、テストを実行してみましょう。  

Ubuntu VM の共有フォルダーに`touch`コマンドを使用して`test.txt`ファイルを作成しましょう。 Windows 共有フォルダーに作成された`test.txt`ファイルが見えますか?  
![Ubuntu VM で`touch`コマンドを使用して`test.txt`ファイルを作成し、Windows で確認します。](/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-create_a_test.txt_file_using_the_touch_command_in_ubuntu_vm_and_check_it_in_windows.png)
_Ubuntu VM で`touch`コマンドを使用して`test.txt`ファイルを作成し、Windows で確認します。_

