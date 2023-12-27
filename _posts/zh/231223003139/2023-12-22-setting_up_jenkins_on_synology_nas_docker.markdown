---
title:  在 Synology NAS Docker 上设置 Jenkins
image:
  path: /assets/images/231223003139/zh-thumb-unclesnote-setting_up_jenkins_on_synology_nas_docker.png
  alt: 在 Synology NAS Docker 上设置 Jenkins
images: ["/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-synology_nas_gui-docker-jenkins_port_settings.png", "/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-jenkins-getting_started.png"]
categories: [乌班图, 詹金斯, 设置]
tags: [乌班图, 码头工人, 詹金斯, 设置]
description:  CI/CD（持续集成/持续部署）工具有很多，Jenkins 是没有许可证限制且开源的有用工具之一。我想谈谈如何在 Synology NAS Docker 上安装 Jenkins。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-23 00:31:39 +0900
ro_id: 231223003139
ro_name: setting_up_jenkins_on_synology_nas_docker
ro_ref: 231223003139/setting_up_jenkins_on_synology_nas_docker
lang: zh
---
**CI/CD(持续集成/持续部署)**工具有很多，Jenkins 是没有许可证限制且开源的有用工具之一。我想谈谈如何在 Synology NAS Docker 上安装 Jenkins。  
- https://pkg.jenkins.io/debian

## 基础环境
Jenkins 需要 JDK 版本 8 或更高版本才能运行。安装 JDK 版本 11。  

```shell
apt-get update
apt-get install -y openjdk-11-jdk

java -version
# + --------------------------------------------------------
openjdk version "11.0.21" 2023-10-17
OpenJDK Runtime Environment (build 11.0.21+9-post-Ubuntu-0ubuntu120.04)
OpenJDK 64-Bit Server VM (build 11.0.21+9-post-Ubuntu-0ubuntu120.04, mixed mode, sharing)
# - --------------------------------------------------------

```
## 安装詹金斯包
要使用APT安装Jenkins，必须将服务器信息添加到APT中。添加Jenkins服务器信息后，apt update时出现错误，说没有key。使用错误消息中显示的密钥将密钥添加到`apt-key`。就我而言，密钥是`5BA31D57EF5975CA`。  

将关键信息添加到 APT 后，安装 Jenkins。  

```shell
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

apt-get update
# + --------------------------------------------------------
...
W: GPG error: https://pkg.jenkins.io/debian-stable binary/ Release: The following signatures couldnt be verified because the public key is not available: NO_PUBKEY 5BA31D57EF5975CA
E: The repository 'http://pkg.jenkins.io/debian-stable binary/ Release' is not signed.
...
# - --------------------------------------------------------

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA
# + --------------------------------------------------------
Executing: /tmp/apt-key-gpghome.d7qO7VDcMV/gpg.1.sh --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA
gpg: key 5BA31D57EF5975CA: public key "Jenkins Project <jenkinsci-board@googlegroups.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1
# - --------------------------------------------------------

apt-get update
# + --------------------------------------------------------
Ign:1 https://pkg.jenkins.io/debian-stable binary/ InRelease
Get:2 https://pkg.jenkins.io/debian-stable binary/ Release [2044 B]
Get:3 https://pkg.jenkins.io/debian-stable binary/ Release.gpg [833 B]
Hit:4 http://archive.ubuntu.com/ubuntu focal InRelease
Hit:5 http://archive.ubuntu.com/ubuntu focal-updates InRelease
Get:6 https://pkg.jenkins.io/debian-stable binary/ Packages [29.6 kB]
Hit:7 http://archive.ubuntu.com/ubuntu focal-backports InRelease
Hit:8 http://security.ubuntu.com/ubuntu focal-security InRelease
Fetched 32.5 kB in 2s (19.3 kB/s)
Reading package lists... Done
# - --------------------------------------------------------

apt-get install jenkins

```
用于将 Jenkins 连接到 Web 的端口号在`/etc/default/jenkins`文件中的`HTTP_PORT`中定义。如果需要更改端口号，可以将其从`8080`更改为所需的值。  

```shell

vi /etc/default/jenkins
# + --------------------------------------------------------
# port for HTTP connector (default 8080; disable with -1)
HTTP_PORT=8080
# - --------------------------------------------------------

```
## 配置 Synology NAS 容器端口并运行 Jenkins
然后，在 Synology NAS GUI 中停止 Ubuntu 容器并设置外部连接到 Jenkins 的端口。我将容器的`8080`端口映射到`48080`端口。  

![Synology NAS GUI - Docker - Jenkins 端口设置](/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-synology_nas_gui-docker-jenkins_port_settings.png)
_Synology NAS GUI - Docker - Jenkins 端口设置_

启动 Ubuntu 容器并运行 Jenkins 服务。简而言之，如果 Ubuntu Docker 停止并重新启动，则需要再次运行 Jenkins 服务。  

```shell
sleep 10
service jenkins restart
```
然后，使用 Web 浏览器连接到 Jenkins。在我的例子中，分配给 Synology NAS 的 IP 地址是`192.168.0.50`，端口是上面设置的`48080`。  
- http://192.168.0.50:48080/


![詹金斯 - 入门](/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-jenkins-getting_started.png)
_詹金斯 - 入门_

使用 /var/lib/jenkins/secrets/initialAdminPassword 文件中写入的初始密码登录，然后继续初始 Jenkins 安装。  

```shell
cat /var/lib/jenkins/secrets/initialAdminPassword
# + --------------------------------------------------------
72b349dadd5d4a83bac10060e536189e
# - --------------------------------------------------------
```
