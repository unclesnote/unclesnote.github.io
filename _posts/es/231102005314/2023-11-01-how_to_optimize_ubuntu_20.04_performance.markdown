---
title:  Cómo optimizar el rendimiento de Ubuntu 20.04
image:
  path: /assets/images/231102005314/es-thumb-unclesnote-how_to_optimize_ubuntu_20.04_performance.png
  alt: Cómo optimizar el rendimiento de Ubuntu 20.04
images: ["/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-application_menu_search_dock_appearance_settings.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-settings_appearance_resize_icon_size.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-warning_popup_for_low_disk_space_on_filessystem_root.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-ubuntu_software-bleachbit.png", "/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-bleachbit.png"]
categories: [ubuntu, Común]
tags: [UbuntuAnimaciones, Tamañodeliconodelmuelle, archivodeintercambio, intercambio, ubuntu, Común, BleachBit]
description:  A menos que esté utilizando una PC con el sistema operativo Ubuntu instalado como computadora principal, es probable que esté usando una PC con
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 00:53:14 +0900
ro_id: 231102005314
ro_name: how_to_optimize_ubuntu_20.04_performance
ro_ref: 231102005314/how_to_optimize_ubuntu_20.04_performance
lang: es
---
A menos que esté utilizando una PC con el sistema operativo Ubuntu instalado como computadora principal, es probable que esté usando una PC con especificaciones de hardware bajas o que esté instalando Ubuntu en Oracle VM VirtualBox.  

Si utiliza principalmente SSH para conectarse de forma remota, no tendrá mucho impacto, pero si manipula con frecuencia la interfaz de usuario en GNOME, el rendimiento puede ser decepcionante. Entonces, aquí hay algunos consejos para optimizar el rendimiento al instalar y configurar Ubuntu.  
## Desactivar animaciones
Si usa Ubuntu en Virtual Box o una PC de gama baja, las animaciones pueden ralentizar el rendimiento del sistema operativo debido a los recursos limitados. A continuación se muestra cómo activar y desactivar animaciones en la GUI de Ubuntu GNOME. Puede ejecutar comandos en la terminal.  

A continuación se muestra el comando de terminal para desactivar las animaciones de Ubuntu y verificar la configuración.  

```shell
$ gsettings set org.gnome.desktop.interface enable-animations false
$ gsettings get org.gnome.desktop.interface enable-animations
false
```
A continuación se muestra el comando de terminal para activar las animaciones de Ubuntu. La diferencia es que el último argumento del comando cambia de "falso" a "verdadero".  

```shell
$ gsettings set org.gnome.desktop.interface enable-animations true
$ gsettings get org.gnome.desktop.interface enable-animations
true
```
## Tamaño del icono del muelle
Si está utilizando una pantalla de resolución limitada, el tamaño predeterminado del ícono del Dock puede ser limitante para registrar y navegar por muchos íconos a la vez. Por lo tanto, puede configurar el tamaño del icono del Dock para que sea pequeño.  

Primero, busque Dock en el "menú Aplicación" y abra la configuración de "Apariencia".  
![Tamaño del icono del Dock - Menú de aplicaciones > Buscar `dock` > Configuración de apariencia](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-application_menu_search_dock_appearance_settings.png)
_Tamaño del icono del Dock - Menú de aplicaciones > Buscar `dock` > Configuración de apariencia_

Luego reduzca "el tamaño del icono" y configúrelo en un tamaño que le parezca bien.  
![Tamaño del icono del Dock - Configuración > Apariencia > Cambiar tamaño "Tamaño del icono"](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-dock_icon_size-settings_appearance_resize_icon_size.png)
_Tamaño del icono del Dock - Configuración > Apariencia > Cambiar tamaño "Tamaño del icono"_

## Aumentar el tamaño del swap
Si está utilizando Ubuntu instalado en Virtual Box, es probable que se asignen menos de 8 GB de memoria a la máquina virtual porque se comparte con su computadora con Windows. Puede que esto no sea un problema si usa Ubuntu de manera informal, pero cuando intenta compilar una plataforma, BSP o software grande, la memoria insuficiente puede provocar fallas en la compilación. Esto se puede solucionar aumentando el tamaño del intercambio.  

Dado que la capacidad del disco duro es más barata que la capacidad de la memoria, aumentemos el intercambio. Consulte el artículo a continuación.  
- https://unclesnote.com/en/231102005313/how_to_increase_swapfile_size_in_ubuntu

## Asegure el espacio libre en el disco
Si está utilizando Ubuntu con una máquina virtual instalada y el tamaño de la imagen no es lo suficientemente grande, es posible que vea una ventana emergente de advertencia como la que se muestra a continuación. Esto puede ocurrir si se acumula en el sistema en archivos temporales o archivos de registro. Si el espacio libre converge a cero, es posible que su máquina virtual Ubuntu no arranque.  
![Ventana emergente de advertencia por poco espacio en disco en la raíz del sistema de archivos](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-warning_popup_for_low_disk_space_on_filessystem_root.png)
_Ventana emergente de advertencia por poco espacio en disco en la raíz del sistema de archivos_

Aunque puede eliminar archivos temporales o archivos de registro del sistema manualmente, puede administrarlos más fácilmente en un entorno GUI utilizando la aplicación [BleachBit](https://www.bleachbit.org/features){:target="_blank"}.  

Puede instalarlo fácilmente buscando "bleachbit" en la aplicación de software de Ubuntu.  
![Software Ubuntu-BleachBit](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-ubuntu_software-bleachbit.png)
_Software Ubuntu-BleachBit_

Después de verificar los elementos que desea organizar, presionar el botón "Limpiar" elimina automáticamente los archivos innecesarios para asegurar espacio libre. Sin embargo, debe tener cuidado al organizar los elementos "APT" y "diario". Esto puede romper su sistema Ubuntu o las dependencias de paquetes.  
![BleachBit](/assets/images/231102005314/unclesnote-how_to_optimize_ubuntu_20.04_performance-bleachbit.png)
_BleachBit_

