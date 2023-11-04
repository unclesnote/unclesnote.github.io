---
title:  Agregar un nuevo disco duro a la máquina virtual Ubuntu (20.04) en VirtualBox
image:
  path: /assets/images/231023215845/es-thumb-unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox.png
  alt: Agregar un nuevo disco duro a la máquina virtual Ubuntu (20.04) en VirtualBox
images: ["/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-create_virtual_hard_disk.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-virtual_hard_disk_initialization_in_progress.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-add_hard_disk_to_ubuntu_vm.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-check_hard_disks_added_to_ubuntu_vm.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-create_partition_table_in_msdos_format.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-create_partition_with_ext4_file_system.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-format_partition_to_ext4.png", "/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-check_uuid_of_disk_partition.png"]
categories: [ubuntu, Caja virtual]
tags: [ubuntu, VirtualBox, Gpartido, fstab, UUID]
description:  Explicaremos cómo crear, adjuntar y usar discos en la VM Ubuntu (20.04) de Oracle VM VirtualBox. Un resumen aproximado del procedimiento es el siguiente.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-23 21:58:45 +0900
ro_id: 231023215845
ro_name: how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox
ro_ref: 231023215845/how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox
lang: es
---
Explicaremos cómo crear, adjuntar y usar discos en la VM Ubuntu (20.04) de Oracle VM VirtualBox.  

Un resumen aproximado del procedimiento es el siguiente.  
- Cree un disco duro virtual en Virtual Box Manager y conéctelo a la máquina virtual de Ubuntu
- Inicializar y formatear dispositivos de disco conectados en la interfaz GUI de Ubuntu
- Haga que el dispositivo de disco esté disponible cada vez que se inicie Ubuntu.

## 1. Cree una imagen de disco y adjúntela a una máquina virtual Ubuntu
Las imágenes de disco se pueden crear a través de "Virtual Media Manager" en el administrador de Virtual Box.  

Planeo crear una imagen de 55 GB y hay dos opciones para crear una imagen de disco. La primera es una opción para ocupar la capacidad de mi disco duro tanto como la he usado, y la segunda es crear una opción para ocupar de una sola vez la capacidad planificada desde el principio. Sin embargo, para un funcionamiento estable, crearé 55 GB a la vez con la segunda opción.  

Creé un disco duro virtual con la opción "Preasignar tamaño completo".  
![Oracle VM VirtualBox Manager: crear un disco duro virtual](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-create_virtual_hard_disk.png)  

Oracle VM VirtualBox Manager: crear un disco duro virtual
{: style="color:gray; font-size: 80%; text-align: center;"}

Cuando termine de crear la imagen del disco virtual, puede verificar el disco creado en la lista de discos duros una vez transcurrido el tiempo de inicialización de la imagen del disco virtual.  
![Oracle VM VirtualBox Manager: inicialización del disco duro virtual en curso](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-virtual_hard_disk_initialization_in_progress.png)  

Oracle VM VirtualBox Manager: inicialización del disco duro virtual en curso
{: style="color:gray; font-size: 80%; text-align: center;"}

Ahora agregaremos el disco duro virtual creado a la VM de Ubuntu.  

Puede agregar un disco duro usando un controlador SATA en la pestaña "Almacenamiento" de la configuración de Ubuntu VM.  
![Oracle VM VirtualBox Manager: agregue un disco duro a Ubuntu VM](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-add_hard_disk_to_ubuntu_vm.png)  

Oracle VM VirtualBox Manager: agregue un disco duro a Ubuntu VM
{: style="color:gray; font-size: 80%; text-align: center;"}

Cuando selecciona el disco duro que creó, puede verificar que el disco duro esté adjunto en la sección de información.  
![Oracle VM VirtualBox Manager: verifique los discos duros agregados a Ubuntu VM](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-oracle_vm_virtualbox_manager-check_hard_disks_added_to_ubuntu_vm.png)  

Oracle VM VirtualBox Manager: verifique los discos duros agregados a Ubuntu VM
{: style="color:gray; font-size: 80%; text-align: center;"}

## 2. Inicialización del disco en una VM Ubuntu
Desde la perspectiva de la máquina virtual, el disco duro está conectado físicamente a la máquina virtual de Ubuntu.  

Ahora vamos a formatear el disco en la VM de Ubuntu. Podemos hacer esto usando el clásico `fdisk`, pero procederemos con una herramienta GUI más intuitiva llamada `Gparted`.  

Instalemos y ejecutemos gparted usando apt.  

```shell
# install gparted
sudo apt-get install gparted
# run gparted
gparted
```
Después de seleccionar el disco duro creado en la esquina superior derecha de GParted, crearemos una tabla de particiones `msdos` y la formatearemos como `ext4` según la imagen a continuación.  

Aplique la tabla de particiones `msdos` a través del menú.  
![Ubuntu VM - GParted - crea una tabla de particiones en formato msdos](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-create_partition_table_in_msdos_format.png)  

Ubuntu VM - GParted - crea una tabla de particiones en formato msdos
{: style="color:gray; font-size: 80%; text-align: center;"}

Luego, crearemos una partición. Haga clic derecho en la partición no asignada y cree una partición del sistema de archivos `ext4`. Lo configuré en tamaño completo.  
![Ubuntu VM - GParted - Crear partición con sistema de archivos ext4](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-create_partition_with_ext4_file_system.png)  

Ubuntu VM - GParted - Crear partición con sistema de archivos ext4
{: style="color:gray; font-size: 80%; text-align: center;"}

Formatee la partición del sistema de archivos ext4 a `etx4`.  

Luego haga clic en la casilla de verificación verde para aplicar la configuración realizada hasta el momento.  
![Ubuntu VM - GParted - Formatear partición a ext4](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-format_partition_to_ext4.png)  

Ubuntu VM - GParted - Formatear partición a ext4
{: style="color:gray; font-size: 80%; text-align: center;"}

La inicialización del disco duro ahora está completa. Para montar un disco duro de modo que pueda usarse cada vez que se inicia la máquina virtual de Ubuntu, se necesita información de ID de disco única. Haga clic derecho en la partición creada, verifique el `UUID` en el menú de información y recuérdelo.  
![Ubuntu VM - GParted - Verifique el UUID de la partición del disco](/assets/images/231023215845/unclesnote-how_to_attach_and_use_a_new_disk_image_for_the_ubuntu_20.04_vm_in_oracle_vm_virtualbox-ubuntu_vm-gparted-check_uuid_of_disk_partition.png)  

Ubuntu VM - GParted - Verifique el UUID de la partición del disco
{: style="color:gray; font-size: 80%; text-align: center;"}

## 3. Cada arranque, monte el disco.
En el estado actual, el dispositivo de disco formateado está listo, pero no hay una ruta a través de la cual se puedan escribir archivos. Entonces, crearemos una ruta conectando mi carpeta específica al dispositivo de disco duro. Esto es "montaje".  

El `UUID` identificado en gparted arriba representa el dispositivo de disco duro, y conectaremos este dispositivo a la carpeta `/mnt/data` para crear una ruta a través de la cual se puedan escribir archivos. Dado que el disco debe estar disponible cada vez que se inicia Ubuntu, lo describiremos en `/etc/fstab`.  

La siguiente línea se agregará a `/etc/fstab`.  

```bash
# UUID=<hard disk device UUID> <folder where the device will be mounted> ext4    defaults          0       0 
UUID=e47277b0-04dd-44f1-a4c0-861654b4d226 /mnt/data       ext4    defaults          0       0 
```
Luego, crearemos un enlace simbólico desde el `/mnt/data` montado a la carpeta `data` en el directorio de inicio.  

El procedimiento detallado es el siguiente y, si ha completado todos los pasos, reinicie.  

```shell
$ mkdir -p /mnt/data
$ sudo chown -R ${USER}:users /mnt/data
$ cd ~/
$ sudo ln -s /mnt/data data
$ sudo vi /etc/fstab  
#-----------------------------------------------------------------------------
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda5 during installation
UUID=76a80216-1031-4871-945c-4c8de2845136 /               ext4    errors=remount-ro 0       1
UUID=e47277b0-04dd-44f1-a4c0-861654b4d226 /mnt/data       ext4    defaults          0       0 
# /boot/efi was on /dev/sda1 during installation
UUID=A4B5-D201  /boot/efi       vfat    umask=0077      0       1
/swapfile                                 none            swap    sw              0       0
```
