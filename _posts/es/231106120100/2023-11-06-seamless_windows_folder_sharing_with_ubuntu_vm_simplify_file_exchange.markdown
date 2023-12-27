---
title:  Configurar la carpeta compartida de Ubuntu en VirtualBox - Compartir archivos de Windows
image:
  path: /assets/images/231106120100/es-thumb-unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange.png
  alt: Configurar la carpeta compartida de Ubuntu en VirtualBox - Compartir archivos de Windows
images: ["/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-oracle_vm_virtualbox-add_shared_folder.png", "/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-create_a_test.txt_file_using_the_touch_command_in_ubuntu_vm_and_check_it_in_windows.png"]
categories: [ubuntu, Caja virtual]
tags: [VirtualBox, vboxsf, ubuntu, Compartircarpetas]
description:  En mi caso, se comparten archivos con frecuencia entre Ubuntu VM y Windows en Oracle VM VirtualBox. Por supuesto, puede utilizar la función Guest Additions
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-06 12:01:00 +0900
ro_id: 231106120100
ro_name: seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange
ro_ref: 231106120100/seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange
lang: es
---
En mi caso, se comparten archivos con frecuencia entre Ubuntu VM y Windows en Oracle VM VirtualBox. Por supuesto, puede utilizar la función Guest Additions para compartir archivos arrastrando el mouse, pero todavía hay ocasiones en las que resulta inconveniente.  

Entonces, me gustaría explicar cómo compartir una carpeta de Windows con una máquina virtual de Ubuntu.  
## Agregar una carpeta compartida en Virtual Box
Vaya a la configuración de su máquina virtual Ubuntu. Luego, agregue la carpeta a compartir en la pestaña "Carpetas compartidas".  

En la ventana de configuración de la carpeta compartida, configure la carpeta que desea compartir con la VM de Ubuntu en "Ruta de la carpeta". Las carpetas restantes y los elementos de configuración son los siguientes.  
- **Ruta de la carpeta**: ruta de la carpeta `Windows` que se compartirá con Ubuntu VM
- **Nombre de carpeta**: este es el apodo de la carpeta compartida. Si es posible, hágalo igual que el nombre de la carpeta "Punto de montaje".
- **Punto de montaje**: Ruta para montar la carpeta compartida en su `Ubuntu VM`
- ☑ **Montaje automático**: monta automáticamente carpetas compartidas al iniciar
- ☑ **Hacer permanente**: este elemento aparece si ingresa la configuración actual mientras se ejecuta la máquina virtual de Ubuntu. Si desea una configuración permanente, verifíquela.


![Oracle VM VirtualBox: agregar carpeta compartida](/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-oracle_vm_virtualbox-add_shared_folder.png)
_Oracle VM VirtualBox: agregar carpeta compartida_

En mi caso, configuré `/home/pooh/_shared` como una carpeta compartida en la VM de Ubuntu. Como referencia, el nombre de mi cuenta de Ubuntu es "pooh".  
## Permisos de carpeta en Ubuntu VM
Si agregó una carpeta compartida mientras se ejecuta la VM de Ubuntu, primero reinicie la VM de Ubuntu.  

Y, cuando intentes ingresar `/home/pooh/_shared`, se mostrará un mensaje de error indicando que no tienes permiso. Esto se debe a que sólo los usuarios incluidos en el grupo `vboxsf` pueden acceder a la carpeta compartida.  

```shell
$ ls -l /home/pooh
total 100
...
drwxrwx---  1 root vboxsf     0 11월  6 10:03 _shared
...

$ cd /home/pooh
bash: cd: /home/pooh: Permission denied

```
Utilice el comando `gpasswd` para agregar su cuenta de Ubuntu al grupo `vboxsf`. Como referencia, el nombre de mi cuenta de Ubuntu es "pooh". Entonces ejecute el comando, reemplazando `pooh` con el nombre de su cuenta de Ubuntu.  

```shell
sudo gpasswd -a pooh vboxsf
```
Lo más importante. Por último, reinicie la máquina virtual de Ubuntu.  
## Pruebas
Una vez que se complete el reinicio de la máquina virtual de Ubuntu, realicemos una prueba.  

Creemos un archivo `test.txt` usando el comando `touch` en la carpeta compartida de la VM de Ubuntu. ¿Puedes ver el archivo `test.txt` creado en la carpeta compartida de Windows?  

![Cree un archivo `test.txt` usando el comando `touch` en Ubuntu VM y verifíquelo en Windows.](/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-create_a_test.txt_file_using_the_touch_command_in_ubuntu_vm_and_check_it_in_windows.png)
_Cree un archivo `test.txt` usando el comando `touch` en Ubuntu VM y verifíquelo en Windows._

