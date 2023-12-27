---
title:  Synology NAS 上の Ubuntu Docker で XRDP をセットアップする
image:
  path: /assets/images/231223003138/ja-thumb-unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas.png
  alt: Synology NAS 上の Ubuntu Docker で XRDP をセットアップする
images: ["/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-virtualbox_port_forwarding_settings_for_xrdp_connection.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-remote_desktop_connection.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-package_center-docker.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-ubuntu_container-port_settings.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-mobaxterm-rdp_session.png"]
categories: [Ubuntu, ドッカー]
tags: [Ubuntu, ドッカー]
description:  VMM (仮想マシン マネージャー) 機能をサポートするエントリー レベルの Synology NAS を購入した場合は、VMM に Windows または Ubuntu をインストールしてもよかったかもしれません。ただし、インストールに時間がかかり、パフォーマンスが低下することにがっかりするかもしれません。そのよう
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-23 00:31:38 +0900
ro_id: 231223003138
ro_name: setting_up_xrdp_in_ubuntu_docker_on_synology_nas
ro_ref: 231223003138/setting_up_xrdp_in_ubuntu_docker_on_synology_nas
lang: ja
---
VMM (仮想マシン マネージャー) 機能をサポートするエントリー レベルの Synology NAS を購入した場合は、VMM に Windows または Ubuntu をインストールしてもよかったかもしれません。ただし、インストールに時間がかかり、パフォーマンスが低下することにがっかりするかもしれません。  

そのような人にとって、GUI インターフェイスで OS を有効にするための Ubuntu Docker に XRDP をインストールするのは最良の選択肢かもしれません。  

2つの方法を説明します。 1 つは、Ubuntu VM の Docker に XRDP をインストールすることです。もう 1 つは、Synology NAS の Docker アプリに Ubuntu コンテナを作成し、XRDP を通じて外部からアクセスできるように設定することです。  
## Ubuntu VM 上の XRDP Docker コンテナ
### Dockerイメージを構築してコンテナを実行する
以下の情報をもとにDockerイメージを作成していきます。以下の内容の`Dockerfile`を作成しましょう。  

```Dockerfile
FROM ubuntu:20.04

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y lubuntu-desktop

RUN rm /run/reboot-required*

RUN useradd -m testuser -p $(openssl passwd 1234)
RUN usermod -aG sudo testuser

RUN apt install -y xrdp
RUN adduser xrdp ssl-cert

RUN sed -i '3 a echo "\
export GNOME_SHELL_SESSION_MODE=Lubuntu\n\
export XDG_SESSION_TYPE=x11\n\
export XDG_CURRENT_DESKTOP=LXQt\n\
export XDG_CONFIG_DIRS=/etc/xdg/xdg-Lubuntu:/etc/xdg\n\
" > ~/.xsessionrc' /etc/xrdp/startwm.sh

EXPOSE 3389

CMD service xrdp start ; bash
```
次に、作成した`Dockerfile`を元にDockerイメージを構築していきます。次に、作成したイメージを使用してコンテナを作成して実行します。  

```shell
# change permission of docker.sock if there is permission error when docker build
sudo chmod 666 /var/run/docker.sock;sudo chown -R ${USER}:users /var/run/docker.sock

# build docker image from Dockerfile
docker build -f Dockerfile -t img-xrdp-lubuntu .

# create docker container from image 
docker run -d -it --name cond-xrdp-lubuntu -p 3389:3389 img-xrdp-lubuntu

```
### VirtualBox のポート転送設定
仮想マシンの外部から Ubuntu VM の Docker コンテナに XRDP にアクセスする場合は、Ubuntu VM でポート転送を設定する必要があります。 RDP プロトコルを使用してポート`43389`に接続しようとすると、これは Ubuntu VM 内のポート`3389`にマッピングされます。  

![XRDP 接続用の VirtualBox ポート転送設定](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-virtualbox_port_forwarding_settings_for_xrdp_connection.png)
_XRDP 接続用の VirtualBox ポート転送設定_

### XRDPリモートアクセス
次に、リモート デスクトップ接続を通じてアドレス`127.0.0.1:43389`に接続します。  

![リモートデスクトップ接続](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-remote_desktop_connection.png)
_リモートデスクトップ接続_

その後、XRDP ログイン ウィンドウが開きます。以下に`ユーザー名`と`パスワード`を入力します。  

![Ubuntu XRDP ログイン画面](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png)
_Ubuntu XRDP ログイン画面_

- **username** : testuser
- **password** : 1234

## Synology NAS 上の XRDP Docker コンテナ
### Docker パッケージのインストールとコンテナーのポート設定
Synology NAS GUI にアクセスします。次に、パッケージ センターで`Docker`を検索し、インストールします。  

![Synology NAS GUI - パッケージ センター - Docker](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-package_center-docker.png)
_Synology NAS GUI - パッケージ センター - Docker_

`ubuntu:20.04`Docker イメージをダウンロードし、そのイメージに基づいてコンテナーを作成しました。また、コンテナのポート設定では、ssh 用のポート `422` と XRDP 用のポート `43389` が開かれました。  

![Synology NAS GUI - Ubuntu コンテナ - ポート設定](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-ubuntu_container-port_settings.png)
_Synology NAS GUI - Ubuntu コンテナ - ポート設定_

### ubuntu SSH および XRDP パッケージをインストールする
以下のコマンドに従って`openssh-server`をインストールします。 ssh は、後で Ubuntu Docker コンテナにリモートでアクセスするときに役立ちます。  

```shell
apt update
apt install openssh-server
apt install -y net-tools
apt install -y vim

vim /etc/ssh/sshd_config
# ----------------------------------------------
# enable `PermitRootLogin` and set it to `yes`
PermitRootLogin yes
# ----------------------------------------------

passwd root 
# ----------------------------------------------
# it will be ssh login password, i have set it as `0000`
0000
# ----------------------------------------------

service ssh start
```
次に、以下のコマンドに従って XRDP のパッケージをインストールします。以下のコマンドに従って XRDP をインストールするときに、おそらく多くのエラー メッセージが表示されるでしょう。これは、`lubuntu-desktop`のインストール中のサウンドやUSBなどのハードウェア依存関係に関連するエラーです。エラー メッセージを無視して続行します。  

```shell
apt update && DEBIAN_FRONTEND=noninteractive apt install -y lubuntu-desktop
rm /run/reboot-required*
useradd -m testuser -p $(openssl passwd 1234)
usermod -aG sudo testuser
apt install -y xrdp
adduser xrdp ssl-cert

sed -i '3 a echo "\
export GNOME_SHELL_SESSION_MODE=Lubuntu\n\
export XDG_SESSION_TYPE=x11\n\
export XDG_CURRENT_DESKTOP=LXQt\n\
export XDG_CONFIG_DIRS=/etc/xdg/xdg-Lubuntu:/etc/xdg\n\
" > ~/.xsessionrc' /etc/xrdp/startwm.sh

service xrdp start

```
### XRDPリモートアクセス
Synology NAS に割り当てられた IP アドレスを使用して XRDP に接続し、上記で設定した`43389`ポートに接続します。  

![MobaXterm - RDP セッション](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-mobaxterm-rdp_session.png)
_MobaXterm - RDP セッション_

その後、XRDP ログイン ウィンドウが開きます。以下に`ユーザー名`と`パスワード`を入力します。  

![Ubuntu XRDP ログイン画面](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png)
_Ubuntu XRDP ログイン画面_

- **username** : testuser
- **password** : 1234

Docker コンテナを停止して再起動した場合は、ssh サービスと xrdp サービスを再度実行する必要があります。  

正確な理由はわかりませんが、xrdp サービスが開始されると、xrdp が正常に動作するには遅延後に再起動する必要がありました。そして、2回目のxrdp接続から、GUIに下部のメニューバーが表示されました。以下の内容を bash スクリプトとして保存して使用できます。  

```bash
echo "start ssh.."
service ssh start

echo "start xrdp.."
rm /var/run/xrdp/xrdp-sesman.pid
service xrdp start
echo "sleep 10 sec.. "
sleep 10
echo "restart xrdp"
service xrdp restart

```
## 参照
- https://youtu.be/0rl5145aEMk?si=aoO3eZyDLPnmCfr
