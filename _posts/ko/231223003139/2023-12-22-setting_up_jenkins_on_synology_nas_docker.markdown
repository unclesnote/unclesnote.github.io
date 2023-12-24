---
title:  Synology NAS Docker에서 Jenkins 설정
image:
  path: /assets/images/231223003139/ko-thumb-unclesnote-setting_up_jenkins_on_synology_nas_docker.png
  alt: Synology NAS Docker에서 Jenkins 설정
images: ["/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-synology_nas_gui-docker-jenkins_port_settings.png", "/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-jenkins-getting_started.png"]
categories: [우분투, 젠킨스]
tags: [우분투, 도커, 젠킨스]
description:  CI/CD(지속적 통합/지속적 배포) 도구가 많이 있는데, Jenkins는 라이선스 제한이 없고 오픈 소스도 없는 유용한 도구 중 하나입니다. Synology NAS Docker에 Jenkins를 설치하는 방법에 대해 이야기하고 싶습니다.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-23 00:31:39 +0900
ro_id: 231223003139
ro_name: setting_up_jenkins_on_synology_nas_docker
ro_ref: 231223003139/setting_up_jenkins_on_synology_nas_docker
lang: ko
---
**CI/CD(지속적 통합/지속적 배포)**도구가 많이 있는데, Jenkins는 라이선스 제한이 없고 오픈 소스도 없는 유용한 도구 중 하나입니다. Synology NAS Docker에 Jenkins를 설치하는 방법에 대해 이야기하고 싶습니다.  
- https://pkg.jenkins.io/debian

## 기본환경
Jenkins가 작동하려면 JDK 버전 8 이상이 필요합니다. JDK 버전 11을 설치합니다.  

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
## 젠킨스 패키지 설치
APT를 사용하여 Jenkins를 설치하려면 APT에 서버 정보를 추가해야 합니다. Jenkins 서버 정보를 추가한 후 `apt update` 도중 키가 없다는 오류가 발생합니다. 오류 메시지에 표시된 키를 사용하여 `apt-key`에 키를 추가하세요. 제 경우에는 키가 `5BA31D57EF5975CA`였습니다.  

APT에 주요 정보를 추가한 후 Jenkins를 설치합니다.  

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
Jenkins를 웹에 연결하기 위한 포트 번호는 `/etc/default/jenkins` 파일의 `HTTP_PORT`에 정의되어 있습니다. 포트 번호를 변경해야 하는 경우 `8080`에서 원하는 값으로 변경하면 됩니다.  

```shell

vi /etc/default/jenkins
# + --------------------------------------------------------
# port for HTTP connector (default 8080; disable with -1)
HTTP_PORT=8080
# - --------------------------------------------------------

```
## Synology NAS 컨테이너 포트 구성 및 Jenkins 실행
그런 다음 Synology NAS GUI에서 Ubuntu 컨테이너를 중지하고 외부 연결용 포트를 Jenkins로 설정합니다. 컨테이너의 `8080` 포트를 `48080` 포트에 매핑했습니다.  
![Synology NAS GUI - Docker - Jenkins 포트 설정](/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-synology_nas_gui-docker-jenkins_port_settings.png)
_Synology NAS GUI - Docker - Jenkins 포트 설정_

Ubuntu 컨테이너를 시작하고 Jenkins 서비스를 실행합니다. 즉, Ubuntu Docker를 중지했다가 다시 시작하면 Jenkins 서비스를 다시 실행해야 합니다.  

```shell
sleep 10
service jenkins restart
```
그런 다음 웹 브라우저를 사용하여 Jenkins에 연결합니다. 저의 경우 Synology NAS에 할당된 IP 주소는 `192.168.0.50`이고 포트는 위에서 설정한 `48080`이었습니다.  
- http://192.168.0.50:48080/

![젠킨스 - 시작하기](/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-jenkins-getting_started.png)
_젠킨스 - 시작하기_

`/var/lib/jenkins/secrets/initialAdminPassword` 파일에 적힌 초기 비밀번호로 로그인하고 Jenkins 초기 설치를 진행합니다.  

```shell
cat /var/lib/jenkins/secrets/initialAdminPassword
# + --------------------------------------------------------
72b349dadd5d4a83bac10060e536189e
# - --------------------------------------------------------
```
