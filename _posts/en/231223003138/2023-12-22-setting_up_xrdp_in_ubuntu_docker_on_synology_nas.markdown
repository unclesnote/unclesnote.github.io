---
title:  Setting up XRDP in Ubuntu Docker on Synology NAS
image:
  path: /assets/images/231223003138/en-thumb-unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas.png
  alt: Setting up XRDP in Ubuntu Docker on Synology NAS
images: ["/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-virtualbox_port_forwarding_settings_for_xrdp_connection.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-remote_desktop_connection.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-package_center-docker.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-ubuntu_container-port_settings.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-mobaxterm-rdp_session.png"]
categories: [Ubuntu, Docker]
tags: [Ubuntu, Docker]
description:  If you purchased an entry-level Synology NAS that supports the VMM (Virtual Machine Manager) function, you may have been happy to install Windows or Ubuntu on
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-23 00:31:38 +0900
ro_id: 231223003138
ro_name: setting_up_xrdp_in_ubuntu_docker_on_synology_nas
ro_ref: 231223003138/setting_up_xrdp_in_ubuntu_docker_on_synology_nas
lang: en
---
If you purchased an entry-level Synology NAS that supports the VMM (Virtual Machine Manager) function, you may have been happy to install Windows or Ubuntu on the VMM. However, you may be disappointed by the long installation time and poor performance.  

For such people, installing XRDP on Ubuntu Docker may be the best option to enable the OS with a GUI interface.  

I will explain two methods. One is to install XRDP in Docker of the Ubuntu VM, and the other is to create an Ubuntu container in Synology NAS's Docker app and set it to be accessible externally through XRDP.  
## XRDP docker container on Ubuntu VM
### Build Docker image and run container
We will create a Docker image based on the information below. Let’s create `Dockerfile` with the contents below.  

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
Then, we will build a Docker image based on the created `Dockerfile`. Then, we will create and run a container with the created image.  

```shell
# change permission of docker.sock if there is permission error when docker build
sudo chmod 666 /var/run/docker.sock;sudo chown -R ${USER}:users /var/run/docker.sock

# build docker image from Dockerfile
docker build -f Dockerfile -t img-xrdp-lubuntu .

# create docker container from image 
docker run -d -it --name cond-xrdp-lubuntu -p 3389:3389 img-xrdp-lubuntu

```
### Port forwarding settings in VirtualBox
If you want to access XRDP from outside the virtual machine to the Ubuntu VM's Docker container, you need to set up port forwarding on the Ubuntu VM. When you try to connect to port `43389` using the RDP protocol, this is mapped to port `3389` inside the Ubuntu VM.  
![VirtualBox port forwarding settings for XRDP connection](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-virtualbox_port_forwarding_settings_for_xrdp_connection.png)
_VirtualBox port forwarding settings for XRDP connection_

### XRDP remote access
Then, connect to the address `127.0.0.1:43389` through remote desktop connection.  
![Remote Desktop Connection](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-remote_desktop_connection.png)
_Remote Desktop Connection_

Afterwards, the XRDP login window will open, enter the `username` and `password` below.  
![Ubuntu XRDP login screen](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png)
_Ubuntu XRDP login screen_

- **username** : testuser
- **password** : 1234

## XRDP Docker container on Synology NAS
### Docker package installation and container port settings
Access the Synology NAS GUI. Then search for `Docker` in Package Center and install it.  
![Synology NAS GUI - Package Center - Docker](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-package_center-docker.png)
_Synology NAS GUI - Package Center - Docker_

I downloaded the `ubuntu:20.04` Docker image and created a container based on that image. And in the container port settings, port `422` for ssh and port `43389` for XRDP were opened.  
![Synology NAS GUI - Ubuntu Container - Port Settings](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-ubuntu_container-port_settings.png)
_Synology NAS GUI - Ubuntu Container - Port Settings_

### Install ubuntu SSH and XRDP packages
Install `openssh-server` by following the command below. ssh will be useful later when remotely accessing the Ubuntu docker container.  

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
Then, install the packages for XRDP by following the command below. You will probably see many error messages while installing XRDP by following the command below. This is an error related to hardware dependencies such as sound and USB and so on while installing `lubuntu-desktop`. Ignore the error message and proceed.  

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
### XRDP remote access
Connect to XRDP using the IP address assigned to your Synology NAS and connect to the `43389` port set above.  
![MobaXterm - RDP Session](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-mobaxterm-rdp_session.png)
_MobaXterm - RDP Session_

Afterwards, the XRDP login window will open, enter the `username` and `password` below.  
![Ubuntu XRDP login screen](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png)
_Ubuntu XRDP login screen_

- **username** : testuser
- **password** : 1234

If the Docker container is stopped and restarted, the ssh and xrdp services must be run again.  

I don't know the exact reason, but once the xrdp service was started, it had to be restarted after a delay for xrdp to operate normally. And from the second xrdp connection, the bottom menu bar was displayed in the GUI. You can save and use the contents below as a bash script.  

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
## Reference
- https://youtu.be/0rl5145aEMk?si=aoO3eZyDLPnmCfr
