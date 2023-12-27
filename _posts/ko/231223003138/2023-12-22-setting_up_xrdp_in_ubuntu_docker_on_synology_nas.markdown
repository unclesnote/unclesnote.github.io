---
title:  Synology NAS의 Ubuntu Docker에서 XRDP 설정
image:
  path: /assets/images/231223003138/ko-thumb-unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas.png
  alt: Synology NAS의 Ubuntu Docker에서 XRDP 설정
images: ["/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-virtualbox_port_forwarding_settings_for_xrdp_connection.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-remote_desktop_connection.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-package_center-docker.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-ubuntu_container-port_settings.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-mobaxterm-rdp_session.png"]
categories: [우분투, 도커]
tags: [우분투, 도커]
description:  VMM(Virtual Machine Manager) 기능을 지원하는 보급형 Synology NAS를 구입한 경우 VMM에 Windows 또는 Ubuntu를 설치하면 좋을 것입니다. 하지만 설치 시간이 길고 성능이 좋지 않아 실망할 수도 있습니다. 그러한 사람들에게는 Ubuntu
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-23 00:31:38 +0900
ro_id: 231223003138
ro_name: setting_up_xrdp_in_ubuntu_docker_on_synology_nas
ro_ref: 231223003138/setting_up_xrdp_in_ubuntu_docker_on_synology_nas
lang: ko
---
VMM(Virtual Machine Manager) 기능을 지원하는 보급형 Synology NAS를 구입한 경우 VMM에 Windows 또는 Ubuntu를 설치하면 좋을 것입니다. 하지만 설치 시간이 길고 성능이 좋지 않아 실망할 수도 있습니다.  

그러한 사람들에게는 Ubuntu Docker에 XRDP를 설치하는 것이 GUI 인터페이스로 OS를 활성화하는 가장 좋은 옵션일 수 있습니다.  

두 가지 방법을 설명하겠습니다. 하나는 Ubuntu VM의 Docker에 XRDP를 설치하는 것이고, 다른 하나는 Synology NAS의 Docker 앱에서 Ubuntu 컨테이너를 생성하고 XRDP를 통해 외부에서 액세스할 수 있도록 설정하는 것입니다.  
## Ubuntu VM의 XRDP 도커 컨테이너
### Docker 이미지 빌드 및 컨테이너 실행
아래 정보를 바탕으로 Docker 이미지를 생성해보겠습니다. 아래 내용으로 `Dockerfile`을 생성해 보겠습니다.  

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
그런 다음 생성된 `Dockerfile`을 기반으로 Docker 이미지를 빌드합니다. 그런 다음 생성된 이미지로 컨테이너를 생성하고 실행하겠습니다.  

```shell
# change permission of docker.sock if there is permission error when docker build
sudo chmod 666 /var/run/docker.sock;sudo chown -R ${USER}:users /var/run/docker.sock

# build docker image from Dockerfile
docker build -f Dockerfile -t img-xrdp-lubuntu .

# create docker container from image 
docker run -d -it --name cond-xrdp-lubuntu -p 3389:3389 img-xrdp-lubuntu

```
### VirtualBox의 포트 전달 설정
가상 머신 외부에서 Ubuntu VM의 Docker 컨테이너로 XRDP에 액세스하려면 Ubuntu VM에서 포트 전달을 설정해야 합니다. RDP 프로토콜을 사용하여 `43389` 포트에 연결하려고 하면 Ubuntu VM 내부의 `3389` 포트에 매핑됩니다.  

![XRDP 연결을 위한 VirtualBox 포트 전달 설정](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-virtualbox_port_forwarding_settings_for_xrdp_connection.png)
_XRDP 연결을 위한 VirtualBox 포트 전달 설정_

### XRDP 원격 액세스
그런 다음 원격 데스크톱 연결을 통해 `127.0.0.1:43389` 주소에 접속합니다.  

![원격 데스크톱 연결](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-remote_desktop_connection.png)
_원격 데스크톱 연결_

이후 XRDP 로그인 창이 열리면 아래에 `사용자 이름`과 `비밀번호`를 입력하세요.  

![우분투 XRDP 로그인 화면](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png)
_우분투 XRDP 로그인 화면_

- **username** : testuser
- **password** : 1234

## Synology NAS의 XRDP Docker 컨테이너
### Docker 패키지 설치 및 컨테이너 포트 설정
Synology NAS GUI에 액세스합니다. 그런 다음 패키지 센터에서 `Docker`를 검색하여 설치하세요.  

![Synology NAS GUI - 패키지 센터 - Docker](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-package_center-docker.png)
_Synology NAS GUI - 패키지 센터 - Docker_

`ubuntu:20.04` Docker 이미지를 다운로드하고 해당 이미지를 기반으로 컨테이너를 만들었습니다. 그리고 컨테이너 포트 설정에서 ssh용 포트 `422`와 XRDP용 포트 `43389`가 열렸습니다.  

![Synology NAS GUI - Ubuntu 컨테이너 - 포트 설정](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-ubuntu_container-port_settings.png)
_Synology NAS GUI - Ubuntu 컨테이너 - 포트 설정_

### 우분투 SSH 및 XRDP 패키지 설치
아래 명령에 따라 `openssh-server`를 설치합니다. ssh는 나중에 Ubuntu docker 컨테이너에 원격으로 액세스할 때 유용합니다.  

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
그런 다음 아래 명령에 따라 XRDP용 패키지를 설치합니다. 아래 명령을 수행하면 XRDP를 설치하는 동안 많은 오류 메시지가 표시될 수 있습니다. `lubuntu-desktop` 설치 중 사운드, USB 등 하드웨어 의존성과 관련된 오류입니다. 오류 메시지를 무시하고 계속 진행하세요.  

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
### XRDP 원격 액세스
Synology NAS에 할당된 IP 주소를 사용하여 XRDP에 연결하고 위에 설정된 `43389` 포트에 연결합니다.  

![MobaXterm - RDP 세션](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-mobaxterm-rdp_session.png)
_MobaXterm - RDP 세션_

이후 XRDP 로그인 창이 열리면 아래에 `사용자 이름`과 `비밀번호`를 입력하세요.  

![우분투 XRDP 로그인 화면](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png)
_우분투 XRDP 로그인 화면_

- **username** : testuser
- **password** : 1234

Docker 컨테이너가 중지되었다가 다시 시작되면 ssh 및 xrdp 서비스를 다시 실행해야 합니다.  

정확한 이유는 모르겠지만, xrdp 서비스가 한번 시작되면 xrdp가 정상적으로 작동하기 위해서는 약간의 지연 후에 다시 시작해야 했습니다. 그리고 두 번째 xrdp 연결부터는 하단 메뉴 표시줄이 GUI에 표시되었습니다. 아래 내용을 bash 스크립트로 저장하여 사용할 수 있습니다.  

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
## 참조
- https://youtu.be/0rl5145aEMk?si=aoO3eZyDLPnmCfr
