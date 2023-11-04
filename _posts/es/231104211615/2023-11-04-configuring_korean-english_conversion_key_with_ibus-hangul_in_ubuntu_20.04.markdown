---
title:  Configuración de la clave de conversión coreano-inglés con ibus-hangul en Ubuntu 20.04
image:
  path: /assets/images/231104211615/es-thumb-unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04.png
  alt: Configuración de la clave de conversión coreano-inglés con ibus-hangul en Ubuntu 20.04
images: ["/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-search_region_and_run_region_lanugages.png", "/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-add_korean_hangul_input_source.png", "/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-korean-english_conversion_key_setting.png"]
categories: [ubuntu, Común]
tags: [ibushangul, ubuntu, Común, Teclados]
description:  Si utiliza Ubuntu con fines de desarrollo de software, escribirá principalmente en inglés. Sin embargo, en algunos casos, puede ser necesario ingresar coreano
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-04 21:16:15 +0900
ro_id: 231104211615
ro_name: configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04
ro_ref: 231104211615/configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04
lang: es
---
Si utiliza Ubuntu con fines de desarrollo de software, escribirá principalmente en inglés. Sin embargo, en algunos casos, puede ser necesario ingresar coreano en la GUI de GNOME.  

Entonces, dado que la configuración predeterminada solo permite la entrada en inglés, usaremos el complemento `ibus-hangul` para configurar la entrada en coreano.  
## ibus-hangul
`ibus-hangul` es un complemento que admite el método de entrada Hangul en Linux o Ubuntu. "ibus" significa "Bus de entrada". Ubuntu ya admite la entrada Hangul, pero actualizaremos y usaremos `ibus-hangul` para la entrada Hangul optimizada.  

Actualice el repositorio de apt y actualice el complemento `ibus-hangul`. Cuando lo instalé, el tamaño del complemento era de 615 MB. Se necesita algún tiempo para actualizar.  

```shell
sudo apt update
sudo apt upgrade ibus-hangul
```
## Configuración de entrada en coreano
Primero, busque la palabra clave "región" en las aplicaciones, luego busque y ejecute la configuración "Región e idioma".  
![Busque `región` y ejecute `Región y idiomas`](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-search_region_and_run_region_lanugages.png)  

Busque `región` y ejecute `Región y idiomas`
{: style="color:gray; font-size: 80%; text-align: center;"}

Luego, agregue "Fuente de entrada" en la pestaña "Región e idioma". Busque "coreano" y agregue "coreano (hangul)".  
![Agregar fuente de entrada `coreano (hangul)`](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-add_korean_hangul_input_source.png)  

Agregar fuente de entrada `coreano (hangul)`
{: style="color:gray; font-size: 80%; text-align: center;"}

Antes de configurar la fuente de entrada recién agregada, elimine el "inglés (EE. UU.)" existente. Esto es para evitar conflictos con la fuente de entrada "Corea (Hangul)" recién agregada. Y la fuente de entrada agregada ya incluye una función de entrada en inglés.  

Haga clic en el ícono de ajustes en la fuente de entrada "Corea (Hangul)" para abrir "IBusHangle Setup".  
![Configuración de clave de conversión coreano-inglés](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-korean-english_conversion_key_setting.png)  

Configuración de clave de conversión coreano-inglés
{: style="color:gray; font-size: 80%; text-align: center;"}

Luego, active `Iniciar en modo Hangul` en la sección `Etc`. Como referencia, cuando inicie Ubuntu, si desea que el primer modo de entrada en la GUI de GNOME sea coreano, habilítelo.  

Y elimine todas las "teclas de alternancia Hangul" agregadas de forma predeterminada. No hay garantía de que coincida con la tecla de cambio de idioma en el teclado real que está utilizando.  

Haga clic en el botón "Agregar" y, cuando se abra una nueva ventana, presione la tecla de cambio de idioma en su teclado. En el caso de mi teclado, se asignó "Alt_R" como tecla de cambio de idioma.  
