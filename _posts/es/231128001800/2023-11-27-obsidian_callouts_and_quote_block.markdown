---
title:  Bloque de citas y rótulos de Obsidian
image:
  path: /assets/images/231128001800/es-thumb-unclesnote-obsidian_callouts_and_quote_block.png
  alt: Bloque de citas y rótulos de Obsidian
images: ["/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-quotation_block.png", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_block.png", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-folding_of_callouts_block.gif", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_predefined_types.png"]
categories: [Obsidiana]
tags: [Obsidiana, Llamadas, Citas]
description:  La definición del diccionario de rótulos es llamar en voz alta y se utiliza para llamar la atención del lector e informarle sobre información importante o
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-28 00:18:00 +0900
ro_id: 231128001800
ro_name: obsidian_callouts_and_quote_block
ro_ref: 231128001800/obsidian_callouts_and_quote_block
lang: es
---
La definición del diccionario de rótulos es llamar en voz alta y se utiliza para llamar la atención del lector e informarle sobre información importante o adicional.  

Aprendamos sobre la gramática y los tipos para expresar llamadas en Obsidian.  
## Diferencias entre bloques de cotizaciones y anotaciones
Un **bloque de comillas**enumera oraciones que comienzan con `>` en cada línea.  

```
> 
> I am a quote block.
> It is a set of lines starting with `>`
> 
```
A continuación se muestra la forma del bloque de citas basado en el tema básico de Obsidian.  
![Obsidiana - Bloque de cotizaciones](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-quotation_block.png)
_Obsidiana - Bloque de cotizaciones_

Al igual que un bloque de comillas, un **bloque de llamadas**es un conjunto de líneas que comienzan con `>`. Sin embargo, puede especificar la forma y el color del icono ingresando un tipo de leyenda en la primera línea y agregando un título.  

```
> [!tip] I'm a tip type, and here's the title.
> 
> I am a callouts block. 
> It is similar to a citation block, but you can specify a type and title for the first line.
> 
```
A continuación se muestra un bloque de notas de tipo sugerencia en el tema básico Obsidian.  
![Obsidiana - Bloque de rótulos](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_block.png)
_Obsidiana - Bloque de rótulos_

## Función de plegado de bloques de llamadas
Sintácticamente, los bloques de llamadas son similares a los bloques de comillas. Sin embargo, en comparación con los bloques de cotizaciones, tiene las siguientes características adicionales  
- Agregar ícono
- Añadir título
- `Función de plegado`

Arriba, se explicó que el bloque de llamadas puede tener íconos y títulos adicionales agregados al bloque de citas.  

Además, el punto fuerte de los rótulos es que tienen una función de plegado. En el caso de Obsidian, los encabezados se pueden plegar, pero **la diferencia entre este y un bloque de llamadas es que se puede especificar el valor inicial**.  

A veces, puedes expresar contenido que deseas enfatizar o agregar notas adicionales en un bloque de notas, pero si el contenido es largo, es posible que quieras dejarlo cerrado inicialmente.  
![Obsidiana - Bloque plegable de llamadas](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-folding_of_callouts_block.gif)
_Obsidiana - Bloque plegable de llamadas_

Puede crear un bloque de llamadas con un valor inicial cerrado agregando un guión (-) al lado del tipo en la primera línea del bloque de llamadas.  

```
> [!success]- Callouts block - Initially folded callouts block
> I am a callouts of type success.
```
## Tipos de bloques de llamadas
Los colores e íconos de los bloques de llamadas predefinidos en Obsidian son los siguientes.  

Puede cambiar el aspecto de las llamadas escribiendo el texto que desee en el tipo de llamadas.  
![Obsidiana - Tipos predefinidos de rótulos](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_predefined_types.png)
_Obsidiana - Tipos predefinidos de rótulos_

Este contenido se presenta en [Ayuda de Obsidian](https://help.obsidian.md/Editing+and+formatting/Callouts){:target="_blank"}, y puede diseñar su propio bloque de llamadas definiendo CSS.  

```
> [!quote] quote

> [!abstract] abstract, summary, tldr

> [!important] tip, hint, important

> [!note] note

> [!info] info

> [!todo] todo

> [!example] example

> [!question] question, help, fnq

> [!warning] warning, caution, attention

> [!failure] failure, fail, missing

> [!danger] danger, error

> [!bug] bug
```
