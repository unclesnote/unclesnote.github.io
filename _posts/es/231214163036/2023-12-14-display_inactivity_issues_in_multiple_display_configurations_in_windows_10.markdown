---
title:  Mostrar problemas de inactividad en múltiples configuraciones de pantalla en Windows 10
image:
  path: /assets/images/231214163036/es-thumb-unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10.png
  alt: Mostrar problemas de inactividad en múltiples configuraciones de pantalla en Windows 10
images: ["/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-windows_+_r_enter_regedit.png", "/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-registry_editor-remove_the_configuration_and_connectivity_folders_in_the_graphicsdrivers_folder.png"]
categories: [Computadora, Solución de problemas]
tags: [Computadora, Solucióndeproblemas]
description:  Soy un usuario que utiliza una computadora portátil entre el trabajo y el hogar. Utilizo dos o más pantallas conectadas a mi computadora portátil tanto en el
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-14 16:30:36 +0900
ro_id: 231214163036
ro_name: display_inactivity_issues_in_multiple_display_configurations_in_windows_10
ro_ref: 231214163036/display_inactivity_issues_in_multiple_display_configurations_in_windows_10
lang: es
---
Soy un usuario que utiliza una computadora portátil entre el trabajo y el hogar. Utilizo dos o más pantallas conectadas a mi computadora portátil tanto en el trabajo como en casa, pero a veces la computadora portátil solo reconoce algunas pantallas y se muestran como inactivas cuando entro en la configuración de pantalla.  

Supongo que Windows gestiona la configuración de pantalla adecuada para cada entorno almacenándola en el registro en forma de valor preestablecido, pero parece que este problema a veces se debe a un giro en esta configuración.  

El método que encontré para resolver este problema es eliminar e inicializar el valor del registro de configuración de pantalla de Windows. En conclusión, debe volver a configurar el entorno de pantallas múltiples. Te explicaré cómo.  
## 1. Abra el Editor del Registro de Windows
Ingrese `regedit` a través del cuadro de diálogo Ejecutar con `Windows + R` o busque `regedit.exe` en el menú Inicio para ejecutar el `Editor del Registro`.  

![Windows + R > Ingrese `regedit`](/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-windows_+_r_enter_regedit.png)
_Windows + R > Ingrese `regedit`_

## 2. Eliminar los valores preestablecidos de visualización en el Editor del Registro
En el Editor del Registro, ingrese la ruta a continuación en la barra de direcciones o navegue hasta la ruta en el árbol.  

```
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers
```
Elimine las siguientes dos carpetas en la carpeta `GraphicsDrivers` del menú contextual.  
- Configuration
- Connectivity


![Editor del Registro: elimine las carpetas `Configuración` y `Conectividad` en la carpeta `GraphicsDrivers`](/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-registry_editor-remove_the_configuration_and_connectivity_folders_in_the_graphicsdrivers_folder.png)
_Editor del Registro: elimine las carpetas `Configuración` y `Conectividad` en la carpeta `GraphicsDrivers`_

## 3. Reinicie Windows
Reinicie Windows. Una vez que se completa el reinicio, desde la perspectiva de Windows, mis pantallas se convierten en pantallas recién reconocidas.  

Por lo tanto, debe restablecer la posición y orientación de las pantallas en la configuración de pantalla. En resumen, esto es muy molesto. Ofrezco mi más sentido pésame.  
