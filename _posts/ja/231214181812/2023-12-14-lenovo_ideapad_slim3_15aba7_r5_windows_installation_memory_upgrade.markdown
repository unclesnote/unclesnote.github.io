---
title:  Lenovo Ideapad Slim3 15ABA7 R5 Windowsのインストール、メモリのアップグレード
image:
  path: /assets/images/231214181812/ja-thumb-unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade.png
  alt: Lenovo Ideapad Slim3 15ABA7 R5 Windowsのインストール、メモリのアップグレード
images: ["/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-ventoy-www.ventoy.net-a_new_bootable_usb_solution.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-bios_security_secure_boot_disabled.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-윈도우11_설치-네트워크_연결_설정_진행불가.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면-나사_제거.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면판_열기.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_커버의_스티커_분리.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_장착.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-신규_메모리_동작_확인을_위해_하단_공간_확보.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-cpu-z-메모리.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-hwinfo64-시스템_요약-메모리.png"]
categories: [それ, パソコン]
tags: [それ, パソコン, Lenovo, ラップトップ]
description:  レノボSlim3 15ABA7 R5はフリーDOSが基本OSでインストールされており、別途ウィンドウをインストールする必要があります。 Windowsのインストールのための基本とメモリをアップグレードする方法を学びましょう。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-14 18:18:12 +0900
ro_id: 231214181812
ro_name: lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade
ro_ref: 231214181812/lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade
lang: ja
---
**レノボSlim3 15ABA7 R5**はフリーDOSが基本OSでインストールされており、別途ウィンドウをインストールする必要があります。  

Windowsのインストールのための基本とメモリをアップグレードする方法を学びましょう。  
## スペック

![Lenovo Slim3 15ABA7 R5](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5.png)
_Lenovo Slim3 15ABA7 R5_

**レノボSlim3 15ABA7 R5**はCPUでライゼン5 4世代(セザンヌ)の5625Uモデルが搭載されている。文論、コスパノートノートパソコンだけにCPUに含まれるGPUを共有して使用する内蔵グラフィックだ。  

価格が比較的安価だが使える性能のコスパノートノートパソコンではあるが、長所ならメモリとハードディスクの拡張性にある。  
- **保存装置**：NVMe M.2 SSD 256GB基本搭載+ 2.5インチSATAハードディスク1個追加スロット
- **メモリ**：8GBオンボード（DDR4-3200）+追加1ソケット

SATAハードディスク1個とDDR4メモリ1個を追加アップグレード可能。  
## Windows USBスティックの準備

![Ventoy - www.ventoy.net - A New Bootable USB Solution](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-ventoy-www.ventoy.net-a_new_bootable_usb_solution.png)
_Ventoy - www.ventoy.net - A New Bootable USB Solution_

一般的にウィンドウをインストールするには、USBスティックにブートが可能なウィンドウイメージバーニングしてインストールするのが一般的である。しかし、私たちは[Ventoy](https://www.ventoy.net/en/download.html){:target="_blank"}というプログラムを使用します。  

VentoyソフトウェアをUSBスティックにバーニングすると、リムーバブルディスクとしてウィンドウが認識する。そして、ダウンロードされたWindows ISOファイルをコピーしてコンピュータを起動すると、USBスティックに保存されたISOファイルを選択して起動が可能です。これは、1つのUSBスティックにさまざまなISOファイルをコピーして選択的に起動してインストールできるという利点があります。  
- **USBスティックにVentoyをインストールする方法**：https://www.ventoy.net/en/doc_start.html

LenovoドライバサイトでWindows 10とWindows 11のシステムドライバをサポートしていますが、私はWindows 11をインストールしました。  

VentoyベースにWindows ISOファイルがコピーされたUSBスティックを用意する。  

そして、レノボドライバーサイトで[無線LANドライバー]をダウンロードしてUSBスティックに保存します。  

Windows 11のインストールの場合、Windows ISOイメージに無線LANドライバが含まれていないため、今後インターネットを介したWindowsの初期設定は進行できません。だから、あらかじめ無線LANドライバを準備する必要があります。  
## BIOS設定とWindowsのインストール
Lenovo Slim3 15ABA7 R5のディスプレイを開きます。自動的にノートパソコンに電源が入り、`F2`を連続して数回押してBIOS設定画面に入ります。  

Ventoyで起動すると、Securiy Verificationに関連したエラーが発生します。これを防ぐために、`Security`メニューの`Secure Boot`を`Disable`に変更します。 USBスティックをラップトップに取り付け、BIOS設定を保存して終了します。  

![BIOS > Security > Secure Boot > Disabled](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-bios_security_secure_boot_disabled.png)
_BIOS > Security > Secure Boot > Disabled_

> **ラップトップディスプレイを開いて自動電源オンを無効にする**  
> おそらく、レノボはラップトップディスプレイを開いたとき、自動的に電源が入るのがユーザーの利便性に良いと思ったようです。  
> この機能が嫌いなら、BIOSで`Configuration`メニューの`Flip to Boot`機能を`Disabled`に変更することができる。  
{: .prompt-info}
VentoryブートメニューからWindows ISOを選択してWindowsをインストールします。  

**レノボSlim3 15ABA7 R5**はWindows11をインストールすると、自動的に無線LANドライバがインストールされません。そのため、`ネットワーク接続`の設定段階でこれ以上進行できなくなります。  

![Windows 11のインストール - `ネットワーク接続`設定進行不可](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-윈도우11_설치-네트워크_연결_설정_진행불가.png)
_Windows 11のインストール - `ネットワーク接続`設定進行不可_

その画面で `Shift + F10`を押してコマンドプロンプトウィンドウを開きます。そして `OOBE\BYPASSNRO` と入力します。  

その後、自動的に再起動しますが、その後`ネットワーク接続`の設定をスキップできます。  

```
OOBE\BYPASSNRO
```
Windowsのインストールが完了したら、USBスティックで保存したWiFiドライバをインストールします。そして、[レノボドライバサイト](https://pcsupport.lenovo.com/kr/ko/products/laptops-and-netbooks/3-series/ideapad-3-15aba7/downloads){:target="_blank"}に接続してインストールできなかった残りのドライバをインストールする。  
## メモリ購入
以下のように**レノボSlim3 15ABA7 R5**はDDR4-3200 8GBのメモリがオンボード形式で装着されている。したがって、メモリデュアルチャネル構成を作成するために、8GB容量のDDR4-3200クロックメモリを購入します。  
- **メモリ**：8GBオンボード（DDR4-3200）+追加1ソケット

ショッピングモールにDDR4-3200あるいはPC4-25600でクロックが表示された、メモリがあれば購入すればよい。  
## メモリアップグレードのインストール
柔らかい布にラップトップをひっくり返し、背面にすべてのネジを緩めます。  

![Lenovo Slim3 15ABA7 R5 - リア - ネジの取り外し](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면-나사_제거.png)
_Lenovo Slim3 15ABA7 R5 - リア - ネジの取り外し_

そして、使用しないプラスチックカードを右上の隙間に入れてバックプレーンを広げてくれる。そして缶詰缶をオープンするように少しずつ回して背面板を開けてくれる。あまりにも深くプラスチックカードを入れるとラップトップ基板が損傷する可能性があるので、少し入れてください。  

![Lenovo Slim3 15ABA7 R5 - バックプレーンを開く](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면판_열기.png)
_Lenovo Slim3 15ABA7 R5 - バックプレーンを開く_

上で説明したように、SATAハードディスク1個とDDR4メモリ1個を追加アップグレード可能だ。  

![Lenovo Slim3 15ABA7 R5 - 内部](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부.png)
_Lenovo Slim3 15ABA7 R5 - 内部_

他のラップトップとは異なり、**Lenovo Slim3 15ABA7 R5**にはメモリスロットカバーがあります。カバーに貼ってあるステッカーを少し外し、カバーを上に持ち上げて取り外します。  

![Lenovo Slim3 15ABA7 R5 - 内部 - メモリカバーのステッカーの取り外し](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_커버의_스티커_분리.png)
_Lenovo Slim3 15ABA7 R5 - 内部 - メモリカバーのステッカーの取り外し_

メモリーを装着した場合は、再度メモリーカバーを装着してステッカーを貼り付けてください。  

![Lenovo Slim3 15ABA7 R5 - 内部 - メモリマウント](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_장착.png)
_Lenovo Slim3 15ABA7 R5 - 内部 - メモリマウント_

そしてバックプレーンを閉じる前に、ラップトップが正常にオンになって起動が可能であることを確認してください。メモリの接触不良で起動しない場合は、バックプレーンを再度開く必要があるため、バックプレーンを閉じていない状態で正常に起動するかどうかを確認してください。  

ラップトップヒンジ部分にタバコケースのようなものを拾ってファンが帰るのに無理がないようにして、ラップトップ電源を入れた。メモリが正常に認識されない場合やブートにならない場合は、メモリを抽出して再装着してみてください。  

![Lenovo Slim3 15ABA7 R5 - 新しいメモリ動作確認のためのボトムスペースを確保](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-신규_메모리_동작_확인을_위해_하단_공간_확보.png)
_Lenovo Slim3 15ABA7 R5 - 新しいメモリ動作確認のためのボトムスペースを確保_

ラップトップが正常に動作している場合は、バックプレーンを閉じて緩めたネジを締め直してください。  
## メモリデュアルチャンネル認識確認
[CPU-Z](https://www.cpuid.com/softwares/cpu-z.html){:target="_blank"}または[HWiNFO64](https://www.hwinfo.com/download/){:target="_blank"}をインストールするか、ポータブルバージョンをダウンロードする。  

CPU-Zでメモリが[デュアルチャンネル](https://en.wikipedia.org/wiki/Multi-channel_memory_architecture){:target="_blank"}で動作する場合、通常はChannelに`Dual`と表示されるが、**レノボSlim3 15ABA7 R5**は `2 x 64-bit` マークされた。  

これがエラーなのかCPU-Zの最新バージョンの違いなのかはわかりません。  

![Lenovo Slim3 15ABA7 R5 - CPU-Z - メモリ](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-cpu-z-메모리.png)
_Lenovo Slim3 15ABA7 R5 - CPU-Z - メモリ_

しかし、HWiNFO64では`Dual-Channel`と正しく表示された。  

![Lenovo Slim3 15ABA7 R5 - HWiNFO64 - システム概要 - メモリ](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-hwinfo64-시스템_요약-메모리.png)
_Lenovo Slim3 15ABA7 R5 - HWiNFO64 - システム概要 - メモリ_

