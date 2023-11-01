---
title:  Ubuntu 20.04 성능을 최적화하는 방법
image:
  path: /assets/images/231102005314/ko-thumb-ubuntu_optimization-ubuntu-appearance.png
  alt: Ubuntu 20.04 성능을 최적화하는 방법
images: ["/assets/images/231102005314/ubuntu_optimization-ubuntu-appearance.png", "/assets/images/231102005314/ubuntu_optimization-ubuntu-settings-appearance-icon-size.png"]
categories: [우분투, 흔한]
tags: [우분투애니메이션, Dock아이콘크기, 스왑파일, 교환, 우분투, 흔한]
description:  Ubuntu OS가 설치된 PC를 메인 컴퓨터로 사용하지 않는 이상, 하드웨어 사양이 낮은 PC를 사용하거나 Oracle VM VirtualBox에 Ubuntu를 설치하게 될 가능성이 높습니다. SSH를 주로 사용하여 원격으로 접속한다면 큰 영향은 없으나, GNOME에서 UI를 자주 조작한다면 성능이 실망스러울 수 있습니다. 따라서 Ubuntu를 설치하고 구성할 때 성능을 최적화하기 위한 몇 가지 팁은 다음과 같습니다.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 00:53:14 +0900
ro_id: 231102005314
ro_name: how_to_optimize_ubuntu_20.04_performance
ro_ref: 231102005314/how_to_optimize_ubuntu_20.04_performance
lang: ko
---
Ubuntu OS가 설치된 PC를 메인 컴퓨터로 사용하지 않는 이상, 하드웨어 사양이 낮은 PC를 사용하거나 Oracle VM VirtualBox에 Ubuntu를 설치하게 될 가능성이 높습니다.  
SSH를 주로 사용하여 원격으로 접속한다면 큰 영향은 없으나, GNOME에서 UI를 자주 조작한다면 성능이 실망스러울 수 있습니다. 따라서 Ubuntu를 설치하고 구성할 때 성능을 최적화하기 위한 몇 가지 팁은 다음과 같습니다.  
## 애니메이션 끄기
Virtual Box나 저사양 PC에서 Ubuntu를 사용하는 경우 제한된 리소스로 인해 애니메이션으로 인해 OS 성능이 저하될 수 있습니다. 다음은 Ubuntu GNOME GUI에서 애니메이션을 끄고 켜는 방법입니다. 터미널에서 명령을 실행할 수 있습니다.  
다음은 Ubuntu 애니메이션을 끄고 설정을 확인하는 터미널 명령입니다.  

```shell
$ gsettings set org.gnome.desktop.interface enable-animations false
$ gsettings get org.gnome.desktop.interface enable-animations
false
```
다음은 Ubuntu 애니메이션을 켜는 터미널 명령입니다. 차이점은 명령의 마지막 인수가 `false`에서 `true`로 변경된다는 것입니다.  

```shell
$ gsettings set org.gnome.desktop.interface enable-animations true
$ gsettings get org.gnome.desktop.interface enable-animations
true
```
## 도크 아이콘 크기
제한된 해상도 디스플레이를 사용하는 경우 Dock의 기본 아이콘 크기로 인해 많은 아이콘을 한 번에 등록하고 탐색하는 데 제한이 있을 수 있습니다. 따라서 Dock 아이콘 크기를 작게 설정할 수 있습니다.  
먼저 `애플리케이션 메뉴`에서 도크를 검색하고 `모양` 설정을 엽니다.  
![Dock 아이콘 크기 - 애플리케이션 메뉴 > `dock` 검색 > 모양 설정](/assets/images/231102005314/ubuntu_optimization-ubuntu-appearance.png)  

Dock 아이콘 크기 - 애플리케이션 메뉴 > `dock` 검색 > 모양 설정
{: style="color:gray; font-size: 80%; text-align: center;"}

그런 다음 `아이콘 크기`를 줄이고 자신에게 보기 좋은 크기로 설정하세요.  
![Dock 아이콘 크기 - 설정 > 모양 > `아이콘 크기` 크기 조정](/assets/images/231102005314/ubuntu_optimization-ubuntu-settings-appearance-icon-size.png)  

Dock 아이콘 크기 - 설정 > 모양 > `아이콘 크기` 크기 조정
{: style="color:gray; font-size: 80%; text-align: center;"}

## 스왑 크기 늘리기
Virtual Box에 설치된 Ubuntu를 사용하는 경우 Windows 컴퓨터와 공유되기 때문에 8GB 미만의 메모리가 가상 머신에 할당될 가능성이 높습니다. Ubuntu를 가볍게 사용하는 경우에는 문제가 되지 않을 수 있지만 대규모 플랫폼, BSP 또는 소프트웨어를 컴파일하려고 할 때 메모리가 부족하면 컴파일 실패가 발생할 수 있습니다. 이 문제는 스왑 크기를 늘리면 해결될 수 있습니다.  
메모리 용량보다 하드디스크 용량이 저렴하므로 스왑을 늘리자. 아래 기사를 참조하시기 바랍니다.  
