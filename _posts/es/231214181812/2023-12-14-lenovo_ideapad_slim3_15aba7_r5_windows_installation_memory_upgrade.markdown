---
title:  Lenovo Ideapad Slim3 15ABA7 R5 Instalación de Windows, actualización de memoria
image:
  path: /assets/images/231214181812/es-thumb-unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade.png
  alt: Lenovo Ideapad Slim3 15ABA7 R5 Instalación de Windows, actualización de memoria
images: ["/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-ventoy-www.ventoy.net-a_new_bootable_usb_solution.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-bios_security_secure_boot_disabled.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-윈도우11_설치-네트워크_연결_설정_진행불가.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면-나사_제거.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면판_열기.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_커버의_스티커_분리.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_장착.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-신규_메모리_동작_확인을_위해_하단_공간_확보.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-cpu-z-메모리.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-hwinfo64-시스템_요약-메모리.png"]
categories: [ÉL, ordenador personal]
tags: [ÉL, ordenadorpersonal, lenovo, Computadoraportátil]
description:  Lenovo Slim3 15ABA7 R5 tiene DOS gratuito instalado como sistema operativo predeterminado, por lo que Windows debe instalarse por separado. Veamos los
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-14 18:18:12 +0900
ro_id: 231214181812
ro_name: lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade
ro_ref: 231214181812/lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade
lang: es
---
**Lenovo Slim3 15ABA7 R5**tiene DOS gratuito instalado como sistema operativo predeterminado, por lo que Windows debe instalarse por separado.  

Veamos los conceptos básicos para instalar Windows y cómo actualizar la memoria.  
## Especificaciones
![Lenovo Slim3 15ABA7 R5](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5.png)
_Lenovo Slim3 15ABA7 R5_

**Lenovo Slim3 15ABA7 R5**está equipado con el modelo 5625U de Ryzen 5 de cuarta generación (Cezanne) como CPU. En resumen, al ser un portátil económico, tiene gráficos integrados que comparten la GPU incluida en la CPU.  

Aunque el precio es relativamente económico, es una computadora portátil rentable con un rendimiento utilizable, pero su ventaja radica en la capacidad de ampliación de la memoria y el disco duro.  
- **Dispositivo de almacenamiento**: NVMe M.2 SSD de 256 GB instalado de serie + 1 ranura adicional para disco duro SATA de 2,5 pulgadas
- **Memoria**: 8 GB integrada (DDR4-3200) + 1 zócalo adicional

Además se puede actualizar un disco duro SATA y una memoria DDR4.  
## Preparar una memoria USB de Windows
![Ventoy - www.ventoy.net - Una nueva solución USB de arranque](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-ventoy-www.ventoy.net-a_new_bootable_usb_solution.png)
_Ventoy - www.ventoy.net - Una nueva solución USB de arranque_

Generalmente, para instalar Windows, es común grabar una imagen de arranque de Windows en una memoria USB e instalarla. Sin embargo, usaremos un programa llamado [Ventoy](https://www.ventoy.net/en/download.html){:target="_blank"}.  

Si graba el software Ventoy en una memoria USB, Windows lo reconocerá como un disco extraíble. Luego, si copia el archivo ISO de Windows descargado e inicia la computadora, puede seleccionar el archivo ISO guardado en la memoria USB e iniciar. Esto tiene la ventaja de permitirle iniciar e instalar selectivamente copiando varios archivos ISO en una sola memoria USB.  
- **Cómo instalar Ventoy en una memoria USB**: https://www.ventoy.net/es/doc_start.html

El sitio de controladores de Lenovo admite controladores de sistema para Windows 10 y Windows 11, pero instalé Windows 11.  

Prepare una memoria USB con el archivo ISO de Windows copiado en la base Ventoy.  

Y, en el sitio de controladores de Lenovo, [controlador de LAN inalámbrica](https://pcsupport.lenovo.com/kr/ko/products/laptops-and-netbooks/3-series/ideapad-3-15aba7/downloads/driver- lista/componente?nombre=%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%82%B9%20%3A%20%EB%AC%B4%EC%84%A0%EB %9E Descargue %9C&amp;id=E3519D23-890E-4DE1-9064-DE6E7DA2515B){:target="_blank"} y guárdelo en una memoria USB.  

En el caso de la instalación de Windows 11, la imagen ISO de Windows no incluye un controlador de LAN inalámbrica, por lo que la configuración inicial de Windows a través de Internet no se puede realizar más adelante. Por lo tanto, es necesario preparar un controlador de LAN inalámbrica con antelación.  
## Configuración del BIOS e instalación de Windows
Abra la pantalla de Lenovo Slim3 15ABA7 R5. La computadora portátil se encenderá automáticamente. Presione `F2` repetidamente para ingresar a la pantalla de configuración del BIOS.  

Al iniciar con Ventoy, se produce un error relacionado con la verificación de seguridad. Para evitar esto, cambie "Arranque seguro" a "Desactivar" en el menú "Seguridad". Inserte la memoria USB en la computadora portátil, guarde la configuración del BIOS y salga.  
![BIOS > Seguridad > Arranque seguro > Deshabilitado](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-bios_security_secure_boot_disabled.png)
_BIOS > Seguridad > Arranque seguro > Deshabilitado_

> **Desactivar el encendido automático cuando se abre la pantalla del portátil**  
> Lenovo probablemente pensó que encender la pantalla de la computadora portátil automáticamente cuando se abría la pantalla de la computadora portátil era bueno para la comodidad del usuario.  
> Si no le gusta esta función, puede cambiar la función "Voltear para arrancar" en el menú "Configuración" del BIOS a "Desactivada".  
{: .prompt-info}
Seleccione la ISO de Windows en el menú de inicio de Ventory e instale Windows.  

**Lenovo Slim3 15ABA7 R5**no instala automáticamente el controlador de LAN inalámbrica al instalar Windows 11. Por lo tanto, ya no es posible continuar con la etapa de configuración de la "conexión de red".  
![Instalación de Windows 11: no se puede continuar con la configuración de "Conexión de red"](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-윈도우11_설치-네트워크_연결_설정_진행불가.png)
_Instalación de Windows 11: no se puede continuar con la configuración de "Conexión de red"_

En esa pantalla, presione `Shift + F10` para abrir una ventana del símbolo del sistema. Luego ingrese `OOBE\BYPASSNRO`.  

Luego, se reiniciará automáticamente y luego podrá omitir la configuración de "conexión de red".  

```
OOBE\BYPASSNRO
```
Una vez que se complete la instalación de Windows, instale el controlador de LAN inalámbrica guardado en la memoria USB. Luego, visite el [sitio de controladores de Lenovo](https://pcsupport.lenovo.com/kr/ko/products/laptops-and-netbooks/3-series/ideapad-3-15aba7/downloads){:target="_blank"} e instale los controladores restantes que podrían no instalarse, sí.  
## compra de memoria
Como se muestra a continuación, **Lenovo Slim3 15ABA7 R5**está equipado con 8 GB de memoria DDR4-3200 integrada. Por lo tanto, para crear una configuración de memoria de doble canal, compre 8 GB de memoria de reloj DDR4-3200.  
- **Memoria**: 8 GB integrada (DDR4-3200) + 1 zócalo adicional

Si hay memoria en el centro comercial con un reloj marcado como DDR4-3200 o PC4-25600, puedes comprarla.  
## Instalar actualización de memoria
Coloque la computadora portátil boca abajo sobre un paño suave y desatornille todos los tornillos de la parte posterior.  
![Lenovo Slim3 15ABA7 R5 - Trasero - Quitar tornillos](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면-나사_제거.png)
_Lenovo Slim3 15ABA7 R5 - Trasero - Quitar tornillos_

Luego, inserte una tarjeta de plástico sin usar en el espacio en la esquina superior derecha para abrir el panel posterior. Luego, abre el panel trasero girándolo poco a poco, como si abrieras una lata de comida enlatada. Si inserta la tarjeta de plástico demasiado profundamente, la placa de la computadora portátil podría dañarse, así que inserte solo un poco.  
![Lenovo Slim3 15ABA7 R5 - Apertura del panel posterior](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면판_열기.png)
_Lenovo Slim3 15ABA7 R5 - Apertura del panel posterior_

Como se explicó anteriormente, se puede actualizar adicionalmente un disco duro SATA y una memoria DDR4.  
![Lenovo Slim3 15ABA7 R5 - Interior](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부.png)
_Lenovo Slim3 15ABA7 R5 - Interior_

A diferencia de otras computadoras portátiles, **Lenovo Slim3 15ABA7 R5**tiene una cubierta para la ranura de memoria. Retire una pequeña cantidad de la pegatina adherida a la cubierta y levante la cubierta para quitarla.  
![Lenovo Slim3 15ABA7 R5 - Interno - Quitar la pegatina de la tapa de la memoria](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_커버의_스티커_분리.png)
_Lenovo Slim3 15ABA7 R5 - Interno - Quitar la pegatina de la tapa de la memoria_

Si ha instalado la memoria, vuelva a instalar la cubierta de la memoria y pegue una pegatina.  
![Lenovo Slim3 15ABA7 R5 - Interno - Memoria instalada](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_장착.png)
_Lenovo Slim3 15ABA7 R5 - Interno - Memoria instalada_

Y antes de cerrar el panel posterior, asegúrese de que la computadora portátil se encienda y arranque correctamente. Si el arranque no se produce debido a un mal contacto con la memoria, se debe abrir nuevamente el panel posterior, así que verifique si el arranque es normal sin cerrar el panel posterior.  

Coloque algo como una pitillera en la bisagra de la computadora portátil para evitar que el ventilador gire y luego encienda la computadora portátil. Si la memoria no se reconoce correctamente o no arranca, intente extraerla y reinstalarla.  
![Lenovo Slim3 15ABA7 R5: espacio inferior seguro para comprobar el funcionamiento de la nueva memoria](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-신규_메모리_동작_확인을_위해_하단_공간_확보.png)
_Lenovo Slim3 15ABA7 R5: espacio inferior seguro para comprobar el funcionamiento de la nueva memoria_

Si la computadora portátil funciona normalmente, cierre el panel posterior y vuelva a apretar los tornillos que se aflojaron.  
## Comprobar el reconocimiento de doble canal de la memoria
Instale [CPU-Z](https://www.cpuid.com/softwares/cpu-z.html){:target="_blank"} o [HWiNFO64](https://www.hwinfo.com/download/){:target="_blank"} o descargue la versión portátil.  

En CPU-Z, si la memoria funciona como [Canal dual] (https://en.wikipedia.org/wiki/Multi-channel_memory_architecture), el canal generalmente se muestra como "Dual", **Lenovo Slim3 15ABA7 R5**es se muestra como `2 x 64 bits`.  

No estoy seguro si esto es un error o una diferencia en la última versión de CPU-Z.  
![Lenovo Slim3 15ABA7 R5 - CPU-Z - Memoria](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-cpu-z-메모리.png)
_Lenovo Slim3 15ABA7 R5 - CPU-Z - Memoria_

Sin embargo, en HWiNFO64, se mostraba correctamente como "Doble canal".  
![Lenovo Slim3 15ABA7 R5 - HWiNFO64 - Resumen del sistema - Memoria](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-hwinfo64-시스템_요약-메모리.png)
_Lenovo Slim3 15ABA7 R5 - HWiNFO64 - Resumen del sistema - Memoria_

