---
title:  Software alternativo esencial para Ubuntu en lugar de herramientas de Windows
image:
  path: /assets/images/231028002032/es-thumb-basic_setting_-_general.png
  alt: Software alternativo esencial para Ubuntu en lugar de herramientas de Windows
images: ["/assets/images/231028002032/basic_setting_-_general.svg", "/assets/images/231028002032/basic_setting_-_general-krusader.png", "/assets/images/231028002032/basic_setting_-_general-gwenview.png", "/assets/images/231028002032/basic_setting_-_general-enable-log-resource-usage-mode.png", "/assets/images/231028002032/basic_setting_-_general-photopea.png", "/assets/images/231028002032/basic_setting_-_general-photopea-adblock.png", "/assets/images/231028002032/basic_setting_-_general-krita.png", "/assets/images/231028002032/basic_setting_-_general-krita-downdlaod-appimage.png", "/assets/images/231028002032/basic_setting_-_general-easystroke.png", "/assets/images/231028002032/basic_setting_-_general-easystroke-download.png"]
categories: [ubuntu, Herramientas]
tags: [Krusader, GwenVer, Fotopea, crita, trazofácil, ImagenViwer, Editordeimagen, Exploradordearchivos, RatónMacro, ubuntu, Herramientas]
description:  Si está utilizando Ubuntu debido a las ventajas específicas del sistema operativo Ubuntu, intentará encontrar software similar disponible en el entorno Ubuntu que utilizó en el entorno Windows. Por lo tanto, presentaré algún software que generalmente es bueno para usar cuando se usa Ubuntu, como un explorador de archivos, un visor/editor de imágenes y herramientas de productividad.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-28 00:20:32 +0900
ro_id: 231028002032
ro_name: essential_software_to_use_on_ubuntu_os
ro_ref: 231028002032/essential_software_to_use_on_ubuntu_os
lang: es
---
Si está utilizando Ubuntu debido a las ventajas específicas del sistema operativo Ubuntu, intentará encontrar software similar disponible en el entorno Ubuntu que utilizó en el entorno Windows. Por lo tanto, presentaré algún software que generalmente es bueno para usar cuando se usa Ubuntu, como un explorador de archivos, un visor/editor de imágenes y herramientas de productividad.  
![Software de Ubuntu](/assets/images/231028002032/basic_setting_-_general.svg)  

Software de Ubuntu
{: style="color:gray; font-size: 80%; text-align: center;"}

## **Explorador de archivos**
### Krusader
Si tiene experiencia usando Q-Dir o [Total Commander](https://www.ghisler.com/download.htm){:target="_blank"} en un entorno Windows, [Krusader](https://krusader.org){:target="_blank"} ofrece la experiencia de dividir Windows y exploración de archivos con varias pestañas.  
![Krusader](/assets/images/231028002032/basic_setting_-_general-krusader.png)  

Krusader
{: style="color:gray; font-size: 80%; text-align: center;"}

El método de instalación es muy sencillo. Puedes instalarlo usando apt.  

```shell
sudo apt update
sudo apt install krusader
```
## **Visor/Editor de imágenes**
### GwenVer
[GwenView](https://github.com/KDE/gwenview){:target="_blank"} es el mejor visor de imágenes de Ubuntu que he usado. Actualizaré si encuentro un visor de imágenes mejor.  
![GwenVer](/assets/images/231028002032/basic_setting_-_general-gwenview.png)  

GwenVer
{: style="color:gray; font-size: 80%; text-align: center;"}

Sin embargo, si actualiza archivos de imagen con frecuencia, a veces la apariencia de la miniatura en la lista de GwenView y la imagen real pueden diferir. Por lo tanto, se recomienda desactivar el uso del caché de miniaturas.  
En `Configuración > Configurar Gwenview > Avanzado`, marque `Modo de uso de recursos bajos`.  
![GwenView: marque `Modo de uso de recursos bajos` para deshabilitar el caché de miniaturas](/assets/images/231028002032/basic_setting_-_general-enable-log-resource-usage-mode.png)  

GwenView: marque `Modo de uso de recursos bajos` para deshabilitar el caché de miniaturas
{: style="color:gray; font-size: 80%; text-align: center;"}

GwenView se puede instalar fácilmente usando apt.  

```shell
sudo apt install gwenview -y
```
### Fotopea
Para quienes estén familiarizados con Photoshop, la mejor alternativa parece ser [Photopia](https://www.photopea.com){:target="_blank"}. Photopia es una aplicación web que proporciona una interfaz muy similar a Photoshop.  
![Fotopea - www.photopea.com](/assets/images/231028002032/basic_setting_-_general-photopea.png)  

Fotopea - www.photopea.com
{: style="color:gray; font-size: 80%; text-align: center;"}

Hay sitios web similares a Photopia, pero la ventaja de Photopia es que permite a los bloqueadores de anuncios bloquear anuncios en la web, que es su modelo de ingresos. Si es usuario del navegador Chrome, busque "AdBlock" en la tienda web e instálelo.  
Incluso si no se utiliza "AdBlock", los anuncios se muestran en una cantidad limitada en el panel derecho en comparación con otros sitios, por lo que no es demasiado molesto.  
![Photopea: anuncios limitados en el panel derecho y extensión AdBlock en el navegador web Chrome](/assets/images/231028002032/basic_setting_-_general-photopea-adblock.png)  

Photopea: anuncios limitados en el panel derecho y extensión AdBlock en el navegador web Chrome
{: style="color:gray; font-size: 80%; text-align: center;"}

### crita
Si buscas un editor de imágenes sin conexión que sea diferente a Photopia, Krita puede ser una alternativa. Sin embargo, los usuarios que están muy familiarizados con Photoshop pueden sentirse poco familiarizados. La interfaz GUI es similar a Photoshop, pero los accesos directos y las herramientas difieren en muchos aspectos.  
![crita](/assets/images/231028002032/basic_setting_-_general-krita.png)  

crita
{: style="color:gray; font-size: 80%; text-align: center;"}

Aunque no es del todo parecido a Photoshop, si quieres editar o dibujar imágenes y buscas un software completo, Krita puede ser una buena opción.  
Krita distribuye software en forma de imágenes de aplicaciones. Visite el sitio de Krita a continuación y descargue la imagen de la aplicación para Linux.  
- [https://krita.org/en/download/krita-desktop](https://krita.org/en/download/krita-desktop)

![Krita - Descargar la aplicación Linux](/assets/images/231028002032/basic_setting_-_general-krita-downdlaod-appimage.png)  

Krita - Descargar la aplicación Linux
{: style="color:gray; font-size: 80%; text-align: center;"}

Otorgue permiso de ejecución a la imagen de la aplicación Krita descargada y ejecútela.  

```shell
cd ~/Downloads
chmod 777 *.appimage
```
## **Productividad**
### Gesto Easystroke (Macro de gesto del mouse)
Si tiene experiencia en el uso del software de macros de gestos del mouse [Strokeit](https://www.tcbmi.com/strokeit){:target="_blank"} en Windows, `Easystroke Gesture` es la mejor alternativa para Ubuntu.  
Si desea dibujar un gesto con el "botón derecho del mouse", necesita la configuración a continuación. De hecho, hacer que se ejecute automáticamente al iniciar es una opción esencial.  
En la pestaña Preferencias de Easystroke, configure Comportamiento en "Botón 3" y configúrelo para que se ejecute automáticamente en Apariencia.  
Las acciones de gestos del mouse se pueden agregar en la pestaña "Acciones".  
![Easystroke - Preferencias](/assets/images/231028002032/basic_setting_-_general-easystroke.png)  

Easystroke - Preferencias
{: style="color:gray; font-size: 80%; text-align: center;"}

Puede instalarlo fácilmente buscándolo en la aplicación de software de Ubuntu.  
![Easystroke - Descargar en software Ubuntu](/assets/images/231028002032/basic_setting_-_general-easystroke-download.png)  

Easystroke - Descargar en software Ubuntu
{: style="color:gray; font-size: 80%; text-align: center;"}

A continuación se muestran algunas teclas de método abreviado que estoy usando al asignarlas a los gestos del mouse.  

|Aplicación|Atajos|Descripción|
| ------- | ---------------- | ----------------- |
|Común|Ctrl + Inicio|Ir al principio de la página|
|Común|Ctrl + Fin|Ir al final de la página|
|Código VS|Ctrl+Alt+-|Regresa|
|Código VS|Ctrl + Mayús + -|Avanzar|

