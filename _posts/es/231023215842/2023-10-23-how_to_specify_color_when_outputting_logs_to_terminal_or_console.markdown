---
title:  Cómo especificar el color al enviar registros a la terminal o consola
image:
  path: /assets/images/231023215842/es-thumb-default.png
  alt: Cómo especificar el color al enviar registros a la terminal o consola
images: 
categories: [ubuntu]
tags: [CódigoVS, Terminal, Consoladedepuración, Producción, ubuntu]
description:  Al desarrollar software, los registros le ayudan a comprobar el funcionamiento y encontrar la causa de los problemas. Sería útil si los registros de errores críticos o niveles de advertencia tuvieran colores que fueran fáciles de encontrar. Puede configurar el color del texto del registro en el IDE que está utilizando, como VS Code o Visual Studio, pero si el software se ejecuta sin un IDE o en un entorno de compilación cruzada como Linux, la configuración no se aplicará. . Por lo tanto, presentaré un método para configurar el color del texto independientemente de la perspectiva del terminal.
public: true
toc: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-23 21:58:42 +0900
ro_id: 231023215842
ro_name: how_to_specify_color_when_outputting_logs_to_terminal_or_console
ro_ref: 231023215842/how_to_specify_color_when_outputting_logs_to_terminal_or_console
lang: es
---
Al desarrollar software, los registros le ayudan a comprobar el funcionamiento y encontrar la causa de los problemas. Sería útil si los registros de errores críticos o niveles de advertencia tuvieran colores que fueran fáciles de encontrar.  
Puede configurar el color del texto del registro en el IDE que está utilizando, como VS Code o Visual Studio, pero si el software se ejecuta sin un IDE o en un entorno de compilación cruzada como Linux, la configuración no se aplicará. . Por lo tanto, presentaré un método para configurar el color del texto independientemente de la perspectiva del terminal.  
> **Cómo cambiar el color del texto de salida en Visual Studio Code**  
> En el caso de VS Code, puede cambiar el color de la consola de depuración o la ventana de salida configurando el valor del color en `workbench.colorCustomizations` en `Configuración > Usuario > Workbanch > Apariencia > Editar en Settings.json`.  
> Para conocer los parámetros de `workbench.colorCustomizations`, consulte el siguiente enlace.  
>   
> [https://code.visualstudio.com/api/references/theme-color](https://code.visualstudio.com/api/references/theme-color){:target="_blank"}    
{: .prompt-info}
## Cómo configurar el color del texto
Para cambiar el color del texto, debe centrar el texto que desea y agregar el código a continuación al principio y al final.  

```shell
# Start 
(Escape Character)[(Style Code);(Text Color);(Background Color)m
# End
(Escape Character)[0m
```
Al final, una línea con el color del texto cambiado tendrá el formato siguiente.  

```
(Escape Character)[(Style Code);(Text Color);(Background Color)m    (text you want)    (Escape Character)[0m
```
A continuación se muestra un ejemplo de la cadena "Soy texto cuyo color ha cambiado" en texto blanco en negrita sobre fondo negro.  

```
\u001b[1;37;40mI am text whose color has been changed\u001b[0m
```
Veamos primero la tabla a continuación. Se enumera cada elemento para cambiar el color del texto.  

| Element                 | Mandatory | Comment                                                                                                                                                  |
| ----------------------- | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Escape Character        | Yes       | Use Unicode, octal, or hexadecimal escape characters, whichever suits you.                                                                               |
| Style Code              | Optional  | You can select text styles such as bold, blink, dim, and underline.                                                                                      |
| Text Color              | Optional  | You can set the text color by selecting from already defined color codes.                                                                                |
| Text(Foreground) Color  | Optional  | You can set the text background color by selecting from already defined color codes.                                                                     |
| `(Escape Character)[0m` | Yes       | Resets the text color and style once set. If you want to change the color of multiple lines, you can reset the text color later at the desired location. |

Aunque el "carácter de escape" es obligatorio, puede utilizar uno de los tres que se describen más adelante dependiendo del método de expresión.  
Puede agregar el `estilo`, el `color de texto` y el `color de fondo` según sus gustos separándolos con `;`. Más adelante explicaremos las opciones que se pueden expresar, pero el orden no importa porque los números que representan cada una son únicos.  
Y finalmente, restablezca el color y estilo del texto usando "(carácter de escape) [0m". A menos que se reinicie, los colores y estilos de texto posteriores continuarán.  
## Códigos de color y estilo
### 1. Personaje de escape
El carácter de escape a continuación es el mismo que 27 en el código ASCII, y el método de expresión es el siguiente y puede usar cualquiera.  
- `\u001b`: Carácter de escape Unicode. Representa el carácter de escape utilizando un punto de código Unicode hexadecimal de 4 dígitos después de `\u`.
- `\033`: Esto representa el carácter de escape usando notación octal
- `\x1b`: Esto representa el carácter de escape usando notación hexadecimal.

### 2. Estilo
Puedes elegir un estilo de texto, pero dudo que sea necesario. Los registros deben ser fáciles de leer.  
- `1`: Negrita (o color intenso)
- `2`: tenue (o débil)
- `4`: subrayado
- `5`: Parpadeo (texto que parpadea rápidamente)
- `7`: Invertir (intercambiar colores de primer plano y de fondo)
- `8`: Oculto (texto invisible)

### 3. Color del texto (primer plano)
Estos son códigos que cambian el color del texto. Piense en ello como anulando los valores predeterminados del software de cliente de terminal que está utilizando.  
- `30`: Negro
- `31`: Rojo
- `32`: Verde
- `33`: Amarillo
- `34`: Azul
- `35`: Magenta
- `36`: cian
- `37`: Blanco

### 4. Color de fondo
- `40`: fondo negro
- `41`: fondo rojo
- `42`: fondo verde
- `43`: fondo amarillo
- `44`: fondo azul
- `45`: fondo magenta
- `46`: fondo cian
- `47`: fondo blanco

### 5. Restablecer color
Si no restablece el color y el estilo del texto, continuará como se configuró inicialmente.  
Normalmente, se agrega al final del texto en el formato "(Carácter de escape) [0m".  
- `0`: Restablece todos los estilos y colores a los valores predeterminados
