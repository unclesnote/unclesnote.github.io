---
title:  在 Synology NAS 上的 Ubuntu Docker 中设置 XRDP
image:
  path: /assets/images/231223003138/zh-thumb-unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas.png
  alt: 在 Synology NAS 上的 Ubuntu Docker 中设置 XRDP
images: ["/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-virtualbox_port_forwarding_settings_for_xrdp_connection.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-remote_desktop_connection.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-package_center-docker.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-ubuntu_container-port_settings.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-mobaxterm-rdp_session.png"]
categories: [乌班图, 码头工人]
tags: [乌班图, 码头工人]
description:  如果您购买了支持 VMM（虚拟机管理器）功能的入门级 Synology NAS，您可能会很乐意在 VMM 上安装 Windows 或 Ubuntu。然而，您可能会对较长的安装时间和较差的性能感到失望。对于这些人来说，在 Ubuntu Docker 上安装 XRDP 可能是启用具有 GUI 界面的操作系统的最佳选择。我
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-23 00:31:38 +0900
ro_id: 231223003138
ro_name: setting_up_xrdp_in_ubuntu_docker_on_synology_nas
ro_ref: 231223003138/setting_up_xrdp_in_ubuntu_docker_on_synology_nas
lang: zh
---
如果您购买了支持 VMM(虚拟机管理器)功能的入门级 Synology NAS，您可能会很乐意在 VMM 上安装 Windows 或 Ubuntu。然而，您可能会对较长的安装时间和较差的性能感到失望。  

对于这些人来说，在 Ubuntu Docker 上安装 XRDP 可能是启用具有 GUI 界面的操作系统的最佳选择。  

我将解释两种方法。一种是在 Ubuntu VM 的 Docker 中安装 XRDP，另一种是在 Synology NAS 的 Docker 应用程序中创建 Ubuntu 容器，并将其设置为可通过 XRDP 从外部访问。  
## Ubuntu VM 上的 XRDP docker 容器
### 构建 Docker 镜像并运行容器
我们将根据以下信息创建 Docker 镜像。让我们使用以下内容创建`Dockerfile`。  

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
然后，我们将根据创建的`Dockerfile`构建一个 Docker 镜像。然后，我们将使用创建的映像创建并运行一个容器。  

```shell
# change permission of docker.sock if there is permission error when docker build
sudo chmod 666 /var/run/docker.sock;sudo chown -R ${USER}:users /var/run/docker.sock

# build docker image from Dockerfile
docker build -f Dockerfile -t img-xrdp-lubuntu .

# create docker container from image 
docker run -d -it --name cond-xrdp-lubuntu -p 3389:3389 img-xrdp-lubuntu

```
### VirtualBox 中的端口转发设置
如果要从虚拟机外部访问 XRDP 到 Ubuntu VM 的 Docker 容器，则需要在 Ubuntu VM 上设置端口转发。当您尝试使用 RDP 协议连接到端口`43389`时，该端口将映射到 Ubuntu VM 内的端口`3389`。  

![XRDP 连接的 VirtualBox 端口转发设置](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-virtualbox_port_forwarding_settings_for_xrdp_connection.png)
_XRDP 连接的 VirtualBox 端口转发设置_

### XRDP 远程访问
然后，通过远程桌面连接连接到地址`127.0.0.1:43389`。  

![远程桌面连接](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-remote_desktop_connection.png)
_远程桌面连接_

之后，将打开 XRDP 登录窗口，在下面输入`用户名`和`密码`。  

![Ubuntu XRDP 登录屏幕](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png)
_Ubuntu XRDP 登录屏幕_

- **username** : testuser
- **password** : 1234

## Synology NAS 上的 XRDP Docker 容器
### Docker包安装和容器端口设置
访问 Synology NAS GUI。然后在套件中心搜索`Docker`并安装它。  

![Synology NAS GUI - 套件中心 - Docker](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-package_center-docker.png)
_Synology NAS GUI - 套件中心 - Docker_

我下载了 `ubuntu:20.04` Docker 映像并基于该映像创建了一个容器。并且在容器端口设置中，打开了用于 ssh 的端口`422`和用于 XRDP 的端口`43389`。  

![Synology NAS GUI - Ubuntu Container - 端口设置](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-ubuntu_container-port_settings.png)
_Synology NAS GUI - Ubuntu Container - 端口设置_

### 安装 ubuntu SSH 和 XRDP 软件包
按照以下命令安装`openssh-server`。稍后远程访问 Ubuntu docker 容器时，ssh 将很有用。  

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
然后，按照以下命令安装 XRDP 软件包。按照以下命令安装 XRDP 时，您可能会看到许多错误消息。这是安装`lubuntu-desktop`时与声音、USB 等硬件依赖相关的错误。忽略错误消息并继续。  

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
### XRDP 远程访问
使用分配给 Synology NAS 的 IP 地址连接到 XRDP，并连接到上面设置的`43389`端口。  

![MobaXterm - RDP 会话](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-mobaxterm-rdp_session.png)
_MobaXterm - RDP 会话_

之后，将打开 XRDP 登录窗口，在下面输入`用户名`和`密码`。  

![Ubuntu XRDP 登录屏幕](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png)
_Ubuntu XRDP 登录屏幕_

- **username** : testuser
- **password** : 1234

如果 Docker 容器停止并重新启动，则必须重新运行 ssh 和 xrdp 服务。  

我不知道确切的原因，但是一旦xrdp服务启动，必须​​在延迟后重新启动xrdp才能正常运行。从第二个 xrdp 连接开始，底部菜单栏显示在 GUI 中。您可以将以下内容保存并用作 bash 脚本。  

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
## 参考
- https://youtu.be/0rl5145aEMk?si=aoO3eZyDLPnmCfr
