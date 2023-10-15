---
title:  Ubuntu에서 Mono Development를 설치하는 방법(디버거 작업 실패)
image:
  path: /assets/images/230928213424/ko-thumb-c_sharp_mono-foscal-fossa.png
  alt: Ubuntu에서 Mono Development를 설치하는 방법(디버거 작업 실패)
images: ["/assets/images/230928213424/c_sharp_mono-foscal-fossa.png", "/assets/images/230928213424/c_sharp_mono-beaver.png", "/assets/images/230928213424/c_sharp_mono-debugger-operation-failed.png"]
categories: [C 샤프]
tags: [CSharp, 디버거, 단핵증]
description:  C# 소프트웨어는 Windows 환경뿐만 아니라 Linux 환경에서도 개발이 가능합니다. 따라서 Mono Project 조직에서는 Mono Development라는 IDE를 배포하고 있으며, 이를 설치하는 방법을 알아보겠습니다. Ubuntu 20.04 버전을 기준으로 설명합니다.
toc: false
# Below is readonly values if it's decided once
layout: post
date: 2023-09-28 21:34:24 +0900
ro_id: 230928213424
ro_name: how_to_install_mono_develop_in_ubuntu__debugger_operation_failed
ro_ref: 230928213424/how_to_install_mono_develop_in_ubuntu__debugger_operation_failed
lang: ko
---
C# 소프트웨어는 Windows 환경뿐만 아니라 Linux 환경에서도 개발이 가능합니다. 따라서 Mono Project 조직에서는 Mono Development라는 IDE를 배포하고 있으며, 이를 설치하는 방법을 알아보겠습니다. Ubuntu 20.04 버전을 기준으로 설명합니다.  
## Ubuntu 20.04에 MonoDevelop 설치
모노 저장소를 추가하고 모노 및 모노개발을 설치합니다. monodevelop은 공식적으로 Ubuntu 18.04까지 지원합니다. 그러나 우리 환경 Ubuntu 20.04에 18.04 배포판 monodevelop을 설치하는 것도 효과가 있었습니다. 참고로 Ubuntu 20.04의 코드명은 'Focal Fossa'이고 18.04의 코드명은 'bionic'입니다.  

```shell
$ sudo apt update
$ sudo apt install dirmngr gnupg apt-transport-https ca-certificates
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
$ sudo apt-add-repository 'deb https://download.mono-project.com/repo/ubuntu stable-focal main'
$ sudo apt install mono-complete
$ mono --version
Mono JIT compiler version 6.12.0.200 (tarball Tue Jul 11 21:37:50 UTC 2023)
Copyright (C) 2002-2014 Novell, Inc, Xamarin Inc and Contributors. www.mono-project.com
	TLS:           __thread
	SIGSEGV:       altstack
	Notifications: epoll
	Architecture:  amd64
	Disabled:      none
	Misc:          softdebug 
	Interpreter:   yes
	LLVM:          yes(610)
	Suspend:       hybrid
	GC:            sgen (concurrent by default)
$ sudo apt install software-properties-common
# https://www.monodevelop.com/download/#fndtn-download-lin
# loooks monodevelop doesn't support ubuntu 20.04, hence add repository for 18.04(bionic)
$ sudo apt-add-repository 'deb https://download.mono-project.com/repo/ubuntu stable-bionic main'
$ sudo apt update
$ sudo apt install monodevelop
```
![우분투 20.04 - Foscal Fossa](/assets/images/230928213424/c_sharp_mono-foscal-fossa.png)  
_우분투 20.04 - Foscal Fossa_

![우분투 18.04 - 바이오닉 비버](/assets/images/230928213424/c_sharp_mono-beaver.png)  
_우분투 18.04 - 바이오닉 비버_

## 모노 현상 문제 해결
### 디버거 작업이 실패했습니다.
Mono Development에서 디버깅을 사용하여 애플리케이션을 실행하면 '디버거 작업 실패' 오류가 발생합니다.  
![디버거 작업이 실패했습니다.](/assets/images/230928213424/c_sharp_mono-debugger-operation-failed.png)  
_디버거 작업이 실패했습니다._

`/user/lib`에 `gnome-terminal` 폴더를 생성하고 `gnome-terminal-server`에서 심볼릭 링크를 생성하면 문제가 해결됩니다.  

```shell
sudo mkdir /usr/lib/gnome-terminal
cd /usr/lib/gnome-terminal
sudo ln -s /usr/libexec/gnome-terminal-server
```
