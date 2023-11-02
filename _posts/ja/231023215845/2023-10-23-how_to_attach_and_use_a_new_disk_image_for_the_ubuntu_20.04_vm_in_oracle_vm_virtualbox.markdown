---
title:  Oracle VM VirtualBox で Ubuntu (20.04) VM に新しいハードディスクを接続して使用する方法
image:
  path: /assets/images/231023215845/ja-thumb-unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox.png
  alt: Oracle VM VirtualBox で Ubuntu (20.04) VM に新しいハードディスクを接続して使用する方法
images: ["/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-create_virtual_hard_disk.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-virtual_hard_disk_initialization_in_progress.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-add_hard_disk_to_ubuntu_vm.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-check_hard_disks_added_to_ubuntu_vm.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-create_partition_table_in_msdos_format.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-create_partition_with_ext4_file_system.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-format_partition_to_ext4.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-check_uuid_of_disk_partition.png"]
categories: [Ubuntu, バーチャルボックス]
tags: [Ubuntu, バーチャルボックス, GParted, fstab, UUID]
description:  Oracle VM VirtualBoxのUbuntu(20.04) VMにディスクを作成、接続、使用する方法を説明します。手順の大まかな流れは以下の通りです。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-23 21:58:45 +0900
ro_id: 231023215845
ro_name: how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox
ro_ref: 231023215845/how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox
lang: ja
---
Oracle VM VirtualBoxのUbuntu(20.04) VMにディスクを作成、接続、使用する方法を説明します。  

手順の大まかな流れは以下の通りです。  
- Virtual Box Manager で仮想ハードディスクを作成し、Ubuntu VM に接続します。
- Ubuntu GUIインターフェイスに接続されたディスクデバイスの初期化とフォーマット
- Ubuntu が起動するたびにディスク デバイスを使用できるようにします。

## 1. ディスク イメージを作成し、Ubuntu VM にアタッチします。
ディスクイメージは、Virtual Box Manager の`Virtual Media Manager`を通じて作成できます。  

55GBのイメージを作成する予定ですが、ディスクイメージの作成には2つのオプションがあります。 1つ目は、使用した分だけハードディスクの容量を占有するオプション、2つ目は、最初から予定していた容量を一気に占有するオプションを作成することです。ただし、安定した動作のために、2 番目のオプションで一度に 55GB を作成します。  

`フルサイズを事前に割り当てる`オプションを使用して仮想ハードディスクを作成しました。  
![Oracle VM VirtualBox Manager - 仮想ハードディスクの作成](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-create_virtual_hard_disk.png)  

Oracle VM VirtualBox Manager - 仮想ハードディスクの作成
{: style="color:gray; font-size: 80%; text-align: center;"}

仮想ディスクイメージの作成が完了し、仮想ディスクイメージの初期化時間が経過すると、ハードディスクリストで作成したディスクを確認できます。  
![Oracle VM VirtualBox Manager - 仮想ハードディスクの初期化が進行中です](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-virtual_hard_disk_initialization_in_progress.png)  

Oracle VM VirtualBox Manager - 仮想ハードディスクの初期化が進行中です
{: style="color:gray; font-size: 80%; text-align: center;"}

次に、作成した仮想ハー​​ドディスクを Ubuntu VM に追加します。  

Ubuntu VM 設定の`ストレージ`タブで SATA コントローラーを使用してハードディスクを追加できます。  
![Oracle VM VirtualBox Manager - Ubuntu VM にハードディスクを追加する](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-add_hard_disk_to_ubuntu_vm.png)  

Oracle VM VirtualBox Manager - Ubuntu VM にハードディスクを追加する
{: style="color:gray; font-size: 80%; text-align: center;"}

作成したハードディスクを選択すると、情報欄にハードディスクが接続されていることが確認できます。  
![Oracle VM VirtualBox Manager - Ubuntu VM に追加されたハードディスクを確認する](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-check_hard_disks_added_to_ubuntu_vm.png)  

Oracle VM VirtualBox Manager - Ubuntu VM に追加されたハードディスクを確認する
{: style="color:gray; font-size: 80%; text-align: center;"}

## 2. Ubuntu VM でのディスクの初期化
仮想マシンの観点から見ると、ハードディスクは Ubuntu VM に物理的に接続されています。  

次に、Ubuntu VM でディスクをフォーマットします。これは古典的な `fdisk` を使用して行うことができますが、ここでは `Gparted` と呼ばれるより直感的な GUI ツールを使用して作業を進めます。  

apt を使用して gparted をインストールして実行しましょう。  

```shell
# install gparted
sudo apt-get install gparted
# run gparted
gparted
```
GParted の右上隅に作成されたハードディスクを選択した後、以下の図に従って `msdos` パーティション テーブルを作成し、それを `ext4` としてフォーマットします。  

メニューからパーティション`msdos`パーティション テーブルを適用します。  
![Ubuntu VM - GParted - msdos 形式でパーティション テーブルを作成する](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-create_partition_table_in_msdos_format.png)  

Ubuntu VM - GParted - msdos 形式でパーティション テーブルを作成する
{: style="color:gray; font-size: 80%; text-align: center;"}

次に、パーティションを作成します。未割り当てのパーティションを右クリックし、`ext4`ファイル システム パーティションを作成します。フルサイズに設定してみました。  
![Ubuntu VM - GParted - ext4 ファイル システムでパーティションを作成する](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-create_partition_with_ext4_file_system.png)  

Ubuntu VM - GParted - ext4 ファイル システムでパーティションを作成する
{: style="color:gray; font-size: 80%; text-align: center;"}

ext4 ファイル システムのパーティションを `etx4` にフォーマットします。  

次に、緑色のチェックボックスをクリックして、これまでに行った設定を適用します。  
![Ubuntu VM - GParted - パーティションを ext4 にフォーマットする](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-format_partition_to_ext4.png)  

Ubuntu VM - GParted - パーティションを ext4 にフォーマットする
{: style="color:gray; font-size: 80%; text-align: center;"}

以上でハードディスクの初期化は完了です。 Ubuntu VM が起動するたびにハードディスクを使用できるようにハードディスクをマウントするには、一意のディスク ID 情報が必要です。作成したパーティションを右クリックし、情報メニューの`UUID`を確認し、記憶しておきます。  
![Ubuntu VM - GParted - ディスク パーティションの UUID を確認する](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-check_uuid_of_disk_partition.png)  

Ubuntu VM - GParted - ディスク パーティションの UUID を確認する
{: style="color:gray; font-size: 80%; text-align: center;"}

## 3. 起動するたびに、ディスクをマウントします
現在の状態では、フォーマットされたディスクデバイスの準備はできていますが、ファイルを書き込むためのパスがありません。そこで、特定のフォルダーをハードディスクデバイスに接続してパスを作成します。これが`マウント`です。  

上記の gparted で特定された `UUID` はハードディスク デバイスを表しており、このデバイスを `/mnt/data` フォルダーに接続して、ファイルを書き込むことができるパスを作成します。 Ubuntu が起動するたびにディスクが使用可能になる必要があるため、これを `/etc/fstab` に記述します。  

以下の行が `/etc/fstab` に追加されます。  

```bash
# UUID=<hard disk device UUID> <folder where the device will be mounted> ext4    defaults          0       0 
UUID=e47277b0-04dd-44f1-a4c0-861654b4d226 /mnt/data       ext4    defaults          0       0 
```
次に、マウントされた `/mnt/data` からホーム ディレクトリの `data` フォルダーへのシンボリック リンクを作成します。  

詳細な手順は以下の通りで、すべての手順が完了したら再起動してください。  

```shell
$ mkdir -p /mnt/data
$ sudo chown -R ${USER}:users /mnt/data
$ cd ~/
$ sudo ln -s /mnt/data data
$ sudo vi /etc/fstab  
#-----------------------------------------------------------------------------
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda5 during installation
UUID=76a80216-1031-4871-945c-4c8de2845136 /               ext4    errors=remount-ro 0       1
UUID=e47277b0-04dd-44f1-a4c0-861654b4d226 /mnt/data       ext4    defaults          0       0 
# /boot/efi was on /dev/sda1 during installation
UUID=A4B5-D201  /boot/efi       vfat    umask=0077      0       1
/swapfile                                 none            swap    sw              0       0
```
