---
title:  Método de reenvío de puertos de Jekyll (GitHub Pages) Virtual Box para pruebas de Windows
image:
  path: /assets/images/231024185205/es-thumb-jekyll_port_forwarding-vm-port-forwarding.png
  alt: Método de reenvío de puertos de Jekyll (GitHub Pages) Virtual Box para pruebas de Windows
images: ["/assets/images/231024185205/jekyll_port_forwarding-vm-port-forwarding.png"]
categories: [Páginas de GitHub]
tags: [Jekyll, VirtualBox, Reenvíodepuertos, PáginasdeGitHub, GitHub]
description:  En mi caso, construyo y pruebo Jekyll en una máquina virtual Ubuntu en Virtual Box y luego lo envío a GitHub. Sin embargo, la apariencia de navegadores como Firefox en una máquina virtual Ubuntu es ligeramente diferente de la apariencia de un Windows X86 real. Entonces, me gustaría explicar el método de reenvío de puertos de Virtual Box para probar Jekyll en el navegador X86 de Windows.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-24 18:52:05 +0900
ro_id: 231024185205
ro_name: jekyll__github_pages_virtual_box_port_forwarding_method_for_windows_testing
ro_ref: 231024185205/jekyll__github_pages_virtual_box_port_forwarding_method_for_windows_testing
lang: es
---
En mi caso, construyo y pruebo Jekyll en una máquina virtual Ubuntu en Virtual Box y luego lo envío a GitHub. Sin embargo, la apariencia de navegadores como Firefox en una máquina virtual Ubuntu es ligeramente diferente de la apariencia de un Windows X86 real. Entonces, me gustaría explicar el método de reenvío de puertos de Virtual Box para probar Jekyll en el navegador X86 de Windows.  
## Ejecutando Jekyll localmente en Ubuntu VM
Primero, verifique la dirección IP de la interfaz de red usando `ifconfig` en la VM de Ubuntu. En mi caso, la dirección IP es `10.0.2.15`.  

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
Para probar Jekyll, ejecútelo e ingrese la dirección IP confirmada anteriormente con la opción `--host`.  

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
## Configure el reenvío de puertos para Ubuntu VM en el administrador de Virtual Box
En la configuración de red de Ubuntu VM en el administrador de Virtual Box, agregue el reenvío de puertos ingresando lo siguiente.  
La dirección "IP invitada" es la dirección IP confirmada en la máquina virtual de Ubuntu.  
- **Nombre**: (Nombre que desees)
- **Protocolo**: TCP
- **IP del host**: 127.0.0.1
- **IP de invitado**: 10.0.2.15 (dirección IP de la VM de Ubuntu confirmada anteriormente)
- **Puerto de invitados**: 4000

![VirtualBox Manager - Reglas de reenvío de puertos](/assets/images/231024185205/jekyll_port_forwarding-vm-port-forwarding.png)  
_VirtualBox Manager - Reglas de reenvío de puertos_

Ahora puedes probar Jekyll conectándote a `127.0.0.1:4000` en tu navegador X86 de Windows.  
