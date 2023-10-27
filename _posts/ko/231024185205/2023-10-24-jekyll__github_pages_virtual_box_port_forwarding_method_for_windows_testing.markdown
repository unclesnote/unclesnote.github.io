---
title:  Windows 테스트를 위한 Jekyll (GitHub Pages) Virtual Box 포트 포워딩 방법
image:
  path: /assets/images/231024185205/ko-thumb-jekyll_port_forwarding-vm-port-forwarding.png
  alt: Windows 테스트를 위한 Jekyll (GitHub Pages) Virtual Box 포트 포워딩 방법
images: ["/assets/images/231024185205/jekyll_port_forwarding-vm-port-forwarding.png"]
categories: [GitHub 페이지]
tags: [지킬, 버추얼박스, 포트포워딩, GitHub페이지, GitHub]
description:  제 경우에는 Virtual Box의 Ubuntu VM에서 Jekyll을 빌드하고 테스트한 다음 GitHub에 푸시합니다. 그러나 Ubuntu VM의 Firefox와 같은 브라우저의 모양과 느낌은 실제 X86 Windows의 모양과 느낌과 약간 다릅니다. 그래서 X86 윈도우 브라우저에서 Jekyll을 테스트하기 위한 Virtual Box 포트포워딩 방법에 대해 설명드리고자 합니다.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-24 18:52:05 +0900
ro_id: 231024185205
ro_name: jekyll__github_pages_virtual_box_port_forwarding_method_for_windows_testing
ro_ref: 231024185205/jekyll__github_pages_virtual_box_port_forwarding_method_for_windows_testing
lang: ko
---
제 경우에는 Virtual Box의 Ubuntu VM에서 Jekyll을 빌드하고 테스트한 다음 GitHub에 푸시합니다. 그러나 Ubuntu VM의 Firefox와 같은 브라우저의 모양과 느낌은 실제 X86 Windows의 모양과 느낌과 약간 다릅니다. 그래서 X86 윈도우 브라우저에서 Jekyll을 테스트하기 위한 Virtual Box 포트포워딩 방법에 대해 설명드리고자 합니다.  
## Ubuntu VM에서 Jekyll을 로컬로 실행하기
먼저 Ubuntu VM에서 `ifconfig`를 사용하여 네트워크 인터페이스의 IP 주소를 확인합니다. 제 경우에는 IP 주소가 `10.0.2.15` 입니다.  

```
$ ifconfig
..
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::e1f0:30d0:1e9b:bafc  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:07:7a:96  txqueuelen 1000  (Ethernet)
        RX packets 9737  bytes 12163823 (12.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 3811  bytes 1289032 (1.2 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
...
```
Jekyll을 테스트하려면 Jekyll을 실행하고 `--host` 옵션으로 위에서 확인한 IP 주소를 입력하세요.  

```shell
$ bundle exec jekyll serve --host 10.0.2.15
Configuration file: /home/myaccount/my_jekyll_root/_config.yml
 Theme Config file: /home/myaccount/my_jekyll_root/_config.yml
            Source: /home/myaccount/my_jekyll_root
       Destination: /home/myaccount/my_jekyll_root/_site
 Incremental build: disabled. Enable with --incremental
      Generating... 
                    done in 1.483 seconds.
 Auto-regeneration: enabled for '/home/myaccount/my_jekyll_root'
    Server address: http://10.0.2.15:4000/
  Server running... press ctrl-c to stop.
```
## Virtual Box 관리자에서 Ubuntu VM에 대한 포트 전달 설정
Virtual Box 관리자의 Ubuntu VM 네트워크 설정에서 다음을 입력하여 포트 전달을 추가합니다.  
`Guest IP` 주소는 Ubuntu VM에서 확인된 IP 주소입니다.  
- **이름** : (원하는 이름)
- **프로토콜** : TCP
- **호스트 IP** : 127.0.0.1
- **Guest IP** : 10.0.2.15 (위에서 확인한 Ubuntu VM의 IP 주소)
- **게스트 포트** : 4000

![VirtualBox Manager - 포트 전달 규칙](/assets/images/231024185205/jekyll_port_forwarding-vm-port-forwarding.png)  

VirtualBox Manager - 포트 전달 규칙
{: style="color:gray; font-size: 80%; text-align: center;"}

이제 X86 Windows 브라우저에서 `127.0.0.1:4000`에 연결하여 Jekyll을 테스트할 수 있습니다.  
