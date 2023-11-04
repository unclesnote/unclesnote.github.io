---
title:  VirtualBox port forwarding method for Jekyll Windows testing
image:
  path: /assets/images/231024185205/en-thumb-unclesnote-jekyll_github_pages_virtual_box_port_forwarding_method_for_windows_testing.png
  alt: VirtualBox port forwarding method for Jekyll Windows testing
images: ["/assets/images/231024185205/unclesnote-jekyll_github_pages_virtual_box_port_forwarding_method_for_windows_testing-virtualbox_manager-port_forwarding_rules.png"]
categories: [GitHub Pages, Jekyll]
tags: [Jekyll, VirtualBox, PortForwarding, GitHubPages, GitHub]
description:  In my case, I build and test Jekyll(GitHub Pages) on an Ubuntu VM in Virtual Box, then push it to GitHub. However, the look and feel of browsers such as
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-24 18:52:05 +0900
ro_id: 231024185205
ro_name: jekyll__github_pages_virtual_box_port_forwarding_method_for_windows_testing
ro_ref: 231024185205/jekyll__github_pages_virtual_box_port_forwarding_method_for_windows_testing
lang: en
---
In my case, I build and test Jekyll(GitHub Pages) on an Ubuntu VM in Virtual Box, then push it to GitHub. However, the look and feel of browsers such as Firefox in an Ubuntu VM are slightly different from the look and feel of an actual X86 Windows. So, I would like to explain the Virtual Box port forwarding method to test Jekyll on the X86 Windows browser.  
## Running Jekyll locally on Ubuntu VM
First, check the IP address of the network interface using `ifconfig` in the Ubuntu VM. In my case, the IP address is `10.0.2.15`.  

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
To test Jekyll, run it and enter the IP address confirmed above with the `--host` option.  

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
## Set up port forwarding for Ubuntu VM in Virtual Box manager
In the network settings of the Ubuntu VM in the Virtual Box manager, add port forwarding by entering the following.  

The `Guest IP` address is the IP address confirmed on the Ubuntu VM.  
- **Name** : (Name you want)
- **Protocol** : TCP
- **Host IP** : 127.0.0.1
- **Guest IP** : 10.0.2.15 (IP address of the Ubuntu VM confirmed above)
- **Guest Port** : 4000

![VirtualBox Manager - Port Forwarding Rules](/assets/images/231024185205/unclesnote-jekyll_github_pages_virtual_box_port_forwarding_method_for_windows_testing-virtualbox_manager-port_forwarding_rules.png)  

VirtualBox Manager - Port Forwarding Rules
{: style="color:gray; font-size: 80%; text-align: center;"}

Now you can test Jekyll by connecting to `127.0.0.1:4000` in your X86 Windows browser.  
