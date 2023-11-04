---
title:  Cómo aumentar el tamaño del archivo de intercambio en Ubuntu
image:
  path: /assets/images/231102005313/es-thumb-unclesnote-how_to_increase_swapfile_size_in_ubuntu.png
  alt: Cómo aumentar el tamaño del archivo de intercambio en Ubuntu
images: ["/assets/images/231102005313/unclesnote-how_to_increase_swapfile_size_in_ubuntu-applications_menu_system_monitor.png"]
categories: [ubuntu, Común]
tags: [fatab, Intercambio, archivodeintercambio, ubuntu, Común]
description:  A veces, si la memoria física de Ubuntu es insuficiente y el sistema operativo continúa funcionando, el rendimiento puede disminuir o pueden ocurrir errores de
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 00:53:13 +0900
ro_id: 231102005313
ro_name: how_to_increase_swapfile_size_in_ubuntu
ro_ref: 231102005313/how_to_increase_swapfile_size_in_ubuntu
lang: es
---
A veces, si la memoria física de Ubuntu es insuficiente y el sistema operativo continúa funcionando, el rendimiento puede disminuir o pueden ocurrir errores de compilación al compilar una plataforma grande o BSP. Por lo tanto, el sistema operativo basado en Linux crea un archivo de intercambio y utiliza archivos en el disco duro como memoria cuando la memoria física es insuficiente. Esto es similar a la memoria virtual en el entorno Windows.  

Ahora me gustaría explicar cómo crear y aplicar un archivo de intercambio en Ubuntu 20.04.  
## cambio de cheques
Utilice el comando `free -m` para verificar el estado del intercambio en mi entorno Ubuntu. Y verifique si hay un "archivo de intercambio" en la "raíz" del sistema. Es común crear un archivo de intercambio en la ruta raíz.  

En mi caso, estoy usando 2 GB de intercambio y el archivo de intercambio está en la ruta raíz.  

````bash
$ free -m
              total        used        free      shared  buff/cache   available
Mem:           4913        1306        2306           8        1300        3359
Swap:          2048           0        2048
$ ls -la /
total 8388712
...
-rw-------   1 root root   2048934592 Jul 24 17:54 swapfile
...
````
## Crear archivo de intercambio
Eliminaré el archivo de intercambio de 2 GB existente y crearé un nuevo archivo de intercambio de 5 GB.  

Primero, desactive la función de intercambio y elimine el archivo de intercambio de 2 GB que ya está en uso.  

```shell
sudo swapoff -v /swapfile
sudo rm /swapfile
```
Luego, crearemos un archivo de intercambio de 5 GB en la raíz y asignaremos el permiso del archivo a 600.  

```shell
sudo fallocate -l 5G /swapfile
sudo chmod 600 /swapfile 
```
Y por último, active el intercambio con el archivo recién creado.  

```bash
sudo mkswap /swapfile
sudo swapon /swapfile
```
A continuación se muestra cómo ejecuté los comandos anteriores.  

```bash
$ sudo swapoff -v /swapfile
[sudo] password for bull: 
swapoff /swapfile
$ sudo rm /swapfile
$ sudo fallocate -l 5G /swapfile
$ ls -l /
total 5242976
...
-rw-r--r--   1 root root   5368709120 Aug 17 14:11 swapfile
...
$ sudo chmod 600 /swapfile 
$ sudo mkswap /swapfile
Setting up swapspace version 1, size = 5 GiB (5368705024 bytes)
no label, UUID=747f641b-70cc-449c-b719-e54154ad8194
$ sudo swapon /swapfile
```
## Registrar archivo de intercambio
Ahora, finalmente, configuraremos Ubuntu para cargar el archivo de intercambio cada vez que arranque.  

Luego, abra `/etc/fstab`.  

```shell
sudo vi /etc/fstab    
```
Y agregue la línea a continuación. Si ya está configurado, no es necesario agregarlo.  

```shell
/swapfile              none            swap    sw              0       0
```
## Reiniciar
Reinicie primero. Después de reiniciar, puede verificar el archivo de intercambio generado anteriormente en el monitor del sistema.  
![Menú `Aplicaciones` > Monitor del sistema](/assets/images/231102005313/unclesnote-how_to_increase_swapfile_size_in_ubuntu-applications_menu_system_monitor.png)  

Menú `Aplicaciones` > Monitor del sistema
{: style="color:gray; font-size: 80%; text-align: center;"}

