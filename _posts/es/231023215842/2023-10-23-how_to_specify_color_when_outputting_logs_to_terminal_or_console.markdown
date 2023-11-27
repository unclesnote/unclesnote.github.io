---
title:  Cómo especificar el color al enviar registros a la terminal o consola
image:
  path: /assets/images/231023215842/es-thumb-unclesnote-how_to_specify_color_when_outputting_logs_to_terminal_or_console.png
  alt: Cómo especificar el color al enviar registros a la terminal o consola
images: 
categories: [ubuntu, Común]
tags: [CódigoVS, Terminal, Consoladedepuración, Producción, ubuntu, Común]
description:  Al desarrollar software, los registros le ayudan a comprobar el funcionamiento y encontrar la causa de los problemas. Sería útil si los registros de errores
public: true
toc: true
toc_intl: false
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
- **Inicio**: `(Carácter de escape)[(Código de estilo);(Color del texto);(Color de fondo)m`
- **Texto**: `(Texto que deseas)`
- **Fin**: `(Carácter de escape)[0m`

Al final, una línea con el color del texto cambiado tendrá el formato siguiente.  
- `(Carácter de escape)[(Código de estilo);(Color del texto);(Color de fondo)m` `(texto que desea)` `(Carácter de escape)[0m`

A continuación se muestra un ejemplo de la cadena "Soy texto" en texto blanco en negrita sobre fondo negro.  

Para conocer el significado de cada número, consulte el código predefinido en la sección posterior.  

```
\u001b[1;37;40mI am text\u001b[0m
```
Veamos primero la tabla a continuación. Se enumera cada elemento para cambiar el color del texto.  

|Elemento|Obligatorio|Comentario|
| ---------------------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
|Personaje de escape|Sí|Utilice caracteres de escape Unicode, octales o hexadecimales, lo que más le convenga.|
|Código de estilo|Opcional|Estilos de texto como negrita, parpadeo, atenuado y subrayado.|
|Color de texto|Opcional|Color del texto seleccionando entre códigos de color ya definidos.|
|Color del texto (primer plano)|Opcional|Color de fondo del texto seleccionando entre códigos de color ya definidos.|
|`(Carácter de escape)[0m`|Sí|Restablece el color y estilo del texto una vez configurado.<br> Si desea cambiar el color de varias líneas, puede restablecer el color del texto más tarde en la ubicación deseada.|

Aunque el `Escape Chacter` es obligatorio, puede utilizar uno de los tres que se describen más adelante dependiendo del método de expresión.  

Puede agregar el `Estilo`, el `Color del texto` y el `Color de fondo` según sus gustos separándolos con `;`. Más adelante explicaremos las opciones que se pueden expresar, pero el orden no importa porque los números que representan cada una son únicos.  

Y finalmente, restablezca el color y estilo del texto usando `(Carácter de escape)[0m``. A menos que se reinicie, los colores y estilos de texto posteriores continuarán.  

Si desea cambiar el color del texto en un script de shell, debe agregar la opción `-e` al comando `echo` para permitir la entrada de barra invertida.  

```shell
echo -e "\033[34m I Am Blue Text ! \033[0m"
```
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
