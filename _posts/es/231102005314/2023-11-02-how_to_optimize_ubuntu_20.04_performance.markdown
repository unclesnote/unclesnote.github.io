---
title:  Cómo optimizar el rendimiento de Ubuntu 20.04
image:
  path: /assets/images/231102005314/es-thumb-ubuntu_optimization-ubuntu-appearance.png
  alt: Cómo optimizar el rendimiento de Ubuntu 20.04
images: ["/assets/images/231102005314/ubuntu_optimization-ubuntu-appearance.png", "/assets/images/231102005314/ubuntu_optimization-ubuntu-settings-appearance-icon-size.png"]
categories: [ubuntu, Común]
tags: [UbuntuAnimaciones, Tamañodeliconodelmuelle, archivodeintercambio, intercambio, ubuntu, Común]
description:  A menos que esté utilizando una PC con el sistema operativo Ubuntu instalado como computadora principal, es probable que esté usando una PC con especificaciones de hardware bajas o que esté instalando Ubuntu en Oracle VM VirtualBox. Si utiliza principalmente SSH para conectarse de forma remota, no tendrá mucho impacto, pero si manipula con frecuencia la interfaz de usuario en GNOME, el rendimiento puede ser decepcionante. Entonces, aquí hay algunos consejos para optimizar el rendimiento al instalar y configurar Ubuntu.
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
![Tamaño del icono del Dock - Menú de aplicaciones > Buscar `dock` > Configuración de apariencia](/assets/images/231102005314/ubuntu_optimization-ubuntu-appearance.png)  

Tamaño del icono del Dock - Menú de aplicaciones > Buscar `dock` > Configuración de apariencia
{: style="color:gray; font-size: 80%; text-align: center;"}

Luego reduzca "el tamaño del icono" y configúrelo en un tamaño que le parezca bien.  
![Tamaño del icono del Dock - Configuración > Apariencia > Cambiar tamaño "Tamaño del icono"](/assets/images/231102005314/ubuntu_optimization-ubuntu-settings-appearance-icon-size.png)  

Tamaño del icono del Dock - Configuración > Apariencia > Cambiar tamaño "Tamaño del icono"
{: style="color:gray; font-size: 80%; text-align: center;"}

## Aumentar el tamaño del swap
Si está utilizando Ubuntu instalado en Virtual Box, es probable que se asignen menos de 8 GB de memoria a la máquina virtual porque se comparte con su computadora con Windows. Puede que esto no sea un problema si usa Ubuntu de manera informal, pero cuando intenta compilar una plataforma, BSP o software grande, la memoria insuficiente puede provocar fallas en la compilación. Esto se puede solucionar aumentando el tamaño del intercambio.  
Dado que la capacidad del disco duro es más barata que la capacidad de la memoria, aumentemos el intercambio. Consulte el artículo a continuación.  
