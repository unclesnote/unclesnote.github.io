---
title:  Cómo adjuntar y usar una nueva imagen de disco para la VM Ubuntu (20.04) en Oracle VM VirtualBox
image:
  path: /assets/images/231023215845/es-thumb-attach_disk-create-virtual-box-disk-image.png
  alt: Cómo adjuntar y usar una nueva imagen de disco para la VM Ubuntu (20.04) en Oracle VM VirtualBox
images: ["/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png", "/assets/images/231023215845/attach_disk-virtual-box-media-image.png", "/assets/images/231023215845/attach_disk-choose-disk.png", "/assets/images/231023215845/attach_disk-attached-disk-image.png", "/assets/images/231023215845/attach_disk-create-partition-table.png", "/assets/images/231023215845/attach_disk-create-partition.png", "/assets/images/231023215845/attach_disk-format-disk.png", "/assets/images/231023215845/attach_disk-disk-uuid.png"]
categories: [ubuntu, Caja virtual]
tags: [ubuntu, VirtualBox]
description:  Explicaremos cómo crear, adjuntar y usar discos en la VM Ubuntu (20.04) de Oracle VM VirtualBox. Un resumen aproximado del procedimiento es el siguiente. #VirtualBox #GParted #fstab
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
- Cree una imagen de disco en Virtual Box Manager y adjúntela a la VM de Ubuntu
- Inicializar y formatear dispositivos de disco conectados en la interfaz GUI de Ubuntu
- Haga que el dispositivo de disco esté disponible cada vez que se inicie Ubuntu.

#VirtualBox #GParted #fstab  
## 1. Cree una imagen de disco en Virtual Box y adjúntela a la VM de Ubuntu
Estoy planeando agregar 55 GB de disco y el método es crear un archivo de imagen de tamaño completo por adelantado en "Virtual Media Manager". Hay formas de aumentar la capacidad de la imagen de forma variable según la capacidad utilizada, pero he visto en alguna parte que una vez que el tamaño del archivo de imagen aumenta, no vuelve a disminuir incluso si usa menos. Elegimos un método más confiable con un tamaño estático.  
![Attach Disk-create-virtual-box-disk-image](/assets/images/231023215845/attach_disk-create-virtual-box-disk-image.png)  
Después de que haya pasado un tiempo para la creación de la imagen, puede verificar la imagen creada en la lista.  
![Attach Disk-virtual-box-media-image](/assets/images/231023215845/attach_disk-virtual-box-media-image.png)  
Vaya a la configuración de la máquina virtual Ubuntu a la que desea adjuntar la imagen del disco creada. Seleccione el disco duro creado previamente para agregar.  
![Attach Disk-choose-disk](/assets/images/231023215845/attach_disk-choose-disk.png)  
Puede ver que la imagen del disco se ha agregado a la VM de Ubuntu. También puede consultar la información de Ubuntu VM en VirtualBox Manager.  
![Attach Disk-attached-disk-image](/assets/images/231023215845/attach_disk-attached-disk-image.png)  
## 2. Inicialice los dispositivos de disco utilizando la herramienta Gparted en la GUI de GNOME
Ejecute la VM de Ubuntu en Virtual Box y crearemos tablas y particiones de disco y procederemos con el formateo.  
Por supuesto, existen herramientas de consola como `fdisk` para esto, pero por conveniencia, usaremos la herramienta de partición GUI de GNOME, `GParted`.  

```shell
# install gparted
sudo apt-get install gparted
# run gparted
gparted
```
Seleccione el dispositivo de disco adjunto y aplique la tabla de particiones en formato `msdos`.  
![Attach Disk-create-partition-table](/assets/images/231023215845/attach_disk-create-partition-table.png)  
Ahora crearemos una partición. En mi caso, creé una partición de tamaño completo como se muestra a continuación.  
![Attach Disk-create-partition](/assets/images/231023215845/attach_disk-create-partition.png)  
Formatéelo en formato `ext4` y haga clic en la casilla de verificación verde para aplicar todas las configuraciones anteriores.  
![Attach Disk-format-disk](/assets/images/231023215845/attach_disk-format-disk.png)  
Marque `UUID` en la información de la partición y cópielo. UUID es la identificación única del dispositivo. El UUID es necesario para que el disco esté disponible automáticamente cada vez que se inicia Ubuntu en la siguiente sección.  
![Attach Disk-disk-uuid](/assets/images/231023215845/attach_disk-disk-uuid.png)  
## 3. Haga que el disco esté disponible en cada inicio de Ubuntu.
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
