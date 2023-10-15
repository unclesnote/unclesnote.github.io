---
title:  How to install Mono Develop in Ubuntu (Debugger operation failed)
image:
  path: /assets/images/230928213424/en-thumb-c_sharp_mono-foscal-fossa.png
  alt: How to install Mono Develop in Ubuntu (Debugger operation failed)
images: ["/assets/images/230928213424/c_sharp_mono-foscal-fossa.png", "/assets/images/230928213424/c_sharp_mono-beaver.png", "/assets/images/230928213424/c_sharp_mono-debugger-operation-failed.png"]
categories: [C Sharp]
tags: [CSharp, Debugger, Mono]
description:  C# software can be developed not only in Windows environments but also in Linux environments. Therefore, the Mono Project organization distributes an IDE called Mono Development, and let's find out how to install it. It is described based on Ubuntu 20.04 version.
toc: false
# Below is readonly values if it's decided once
layout: post
date: 2023-09-28 21:34:24 +0900
ro_id: 230928213424
ro_name: how_to_install_mono_develop_in_ubuntu__debugger_operation_failed
ro_ref: 230928213424/how_to_install_mono_develop_in_ubuntu__debugger_operation_failed
lang: en
---
C# software can be developed not only in Windows environments but also in Linux environments. Therefore, the Mono Project organization distributes an IDE called Mono Development, and let's find out how to install it. It is described based on Ubuntu 20.04 version.  
## Install MonoDevelop on Ubuntu 20.04
Add repository of mono and install mono and monodevelop. monodevelop officially supports Ubuntu up to 18.04. However, installing 18.04 distribution monodevelop in our environment Ubuntu 20.04 also worked. For reference, Ubuntu 20.04 is codenamed `Focal Fossa` and 18.04 is codenamed `bionic`  

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
![Ubuntu 20.04 - Foscal Fossa](/assets/images/230928213424/c_sharp_mono-foscal-fossa.png)  
_Ubuntu 20.04 - Foscal Fossa_

![Ubuntu 18.04 - Bionic Beaver](/assets/images/230928213424/c_sharp_mono-beaver.png)  
_Ubuntu 18.04 - Bionic Beaver_

## Troubleshooting on Mono Develop
### Debugger operation failed
When executing an application with debugging on Mono Develop, a `Debugger operation failed` error occurs.  
![Debugger operation failed](/assets/images/230928213424/c_sharp_mono-debugger-operation-failed.png)  
_Debugger operation failed_

Creating a `gnome-terminal` folder in `/user/lib` and creating a symbolic link from the `gnome-terminal-server` solves the problem.  

```shell
sudo mkdir /usr/lib/gnome-terminal
cd /usr/lib/gnome-terminal
sudo ln -s /usr/libexec/gnome-terminal-server
```
