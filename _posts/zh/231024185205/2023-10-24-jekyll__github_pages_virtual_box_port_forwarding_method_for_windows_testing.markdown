---
title:  Jekyll (GitHub Pages) Windows测试的Virtual Box端口转发方法
image:
  path: /assets/images/231024185205/zh-thumb-jekyll_port_forwarding-vm-port-forwarding.png
  alt: Jekyll (GitHub Pages) Windows测试的Virtual Box端口转发方法
images: ["/assets/images/231024185205/jekyll_port_forwarding-vm-port-forwarding.png"]
categories: [GitHub 页面]
tags: [杰基尔, 虚拟盒子, 转发端口, GitHub页面, GitHub]
description:  就我而言，我在 Virtual Box 中的 Ubuntu VM 上构建并测试 Jekyll，然后将其推送到 GitHub。然而，Ubuntu VM 中的 Firefox 等浏览器的外观和感觉与实际 X86 Windows 的外观和感觉略有不同。所以，我想解释一下在X86 Windows浏览器上测试Jekyll的Virtual Box端口转发方法。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-24 18:52:05 +0900
ro_id: 231024185205
ro_name: jekyll__github_pages_virtual_box_port_forwarding_method_for_windows_testing
ro_ref: 231024185205/jekyll__github_pages_virtual_box_port_forwarding_method_for_windows_testing
lang: zh
---
就我而言，我在 Virtual Box 中的 Ubuntu VM 上构建并测试 Jekyll，然后将其推送到 GitHub。然而，Ubuntu VM 中的 Firefox 等浏览器的外观和感觉与实际 X86 Windows 的外观和感觉略有不同。所以，我想解释一下在X86 Windows浏览器上测试Jekyll的Virtual Box端口转发方法。  
## 在 Ubuntu VM 上本地运行 Jekyll
首先，在 Ubuntu VM 中使用`ifconfig`检查网络接口的 IP 地址。在我的例子中，IP 地址是`10.0.2.15`。  

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
要测试 Jekyll，请运行它并使用`--host`选项输入上面确认的 IP 地址。  

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
## 在 Virtual Box 管理器中为 Ubuntu VM 设置端口转发
在 Virtual Box 管理器中 Ubuntu VM 的网络设置中，输入以下内容来添加端口转发。  
`Guest IP`地址是在 Ubuntu VM 上确认的 IP 地址。  
- **姓名**：（您想要的名字）
- **协议**：TCP
- **主机IP**：127.0.0.1
- **来宾 IP**：10.0.2.15（上面确认的 Ubuntu VM 的 IP 地址）
- **访客端口**：4000

![VirtualBox Manager - 端口转发规则](/assets/images/231024185205/jekyll_port_forwarding-vm-port-forwarding.png)  

VirtualBox Manager - 端口转发规则
{: style="color:gray; font-size: 80%; text-align: center;"}

现在您可以通过在 X86 Windows 浏览器中连接到`127.0.0.1:4000`来测试 Jekyll。  
