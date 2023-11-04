---
title:  Diferencias de salto de línea- verificación EOL de Windows y Linux y sincronización de Git Repo
image:
  path: /assets/images/231102144717/es-thumb-unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync.png
  alt: Diferencias de salto de línea- verificación EOL de Windows y Linux y sincronización de Git Repo
images: ["/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-same_file_contents_but_different_files,_on_the_left_is_windows_pc_format_and_on_the_right_is_linux_unix_format.png", "/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-notepad++-eol_conversion-edit_eol_conversion_windows_cr_lf_or_unix_lf.png", "/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-accessing_git_bash_on_windows.png"]
categories: [git]
tags: [git, CRLF, LF, ConversiónEOL, Saltosdelínea, BlocdenotasPlusPlus, unix2dos, dos2unix]
description:  Si necesita modificar y confirmar archivos en un repositorio de Git tanto en Linux como en Windows, puede haber casos en los que el cliente Git reconozca el
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 14:47:17 +0900
ro_id: 231102144717
ro_name: line_break_differences_windows_and_linux_eol_check_and_git_repo_sync
ro_ref: 231102144717/line_break_differences_windows_and_linux_eol_check_and_git_repo_sync
lang: es
---
Si necesita modificar y confirmar archivos en un repositorio de Git tanto en Linux como en Windows, puede haber casos en los que el cliente Git reconozca el archivo como un archivo modificado en la etapa de confirmación de Git aunque el contenido claramente no haya sido modificado.  

La causa del problema es que aunque el contenido del archivo es el mismo, la forma básica de expresar saltos de línea en Windows y Linux es diferente. En la imagen de abajo, la izquierda es un archivo modificado y guardado en Windows (PC), y la derecha es un archivo modificado y guardado en Linux (UNIX).  
![El mismo contenido de archivo pero archivos diferentes, a la izquierda está el formato de PC con Windows y a la derecha está el formato Linux UNIX](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-same_file_contents_but_different_files,_on_the_left_is_windows_pc_format_and_on_the_right_is_linux_unix_format.png)  

El mismo contenido de archivo pero archivos diferentes, a la izquierda está el formato de PC con Windows y a la derecha está el formato Linux UNIX
{: style="color:gray; font-size: 80%; text-align: center;"}

## Diferencias de saltos de línea entre Windows y Linux
Desde una perspectiva de caracteres ASCII,  

Windows expresa saltos de línea en forma de "CRLF (retorno de carro con avance de línea)" como se muestra a continuación.  

```text
\r\n
```
En sistemas Linux como Ubuntu, los saltos de línea se expresan solo como "LF (salto de línea)", como se muestra a continuación.  

```text
\n
```
Supongamos que recibió un archivo que expresa nuevas líneas en formato LF de Git, lo modificó brevemente en un editor de Windows y luego lo restauró. Esto significa que el archivo tiene el mismo contenido en la superficie, pero los saltos de línea se modifican con CRLF, por lo que existe la posibilidad de que se transforme en un archivo diferente al archivo en Git.  

Si ejecuta un script bash escrito en Windows en Linux, puede encontrar misteriosos errores de ejecución del script durante la depuración. Esto puede deberse a que el script de shell almacenó saltos de línea en formato CRLF en Windows y bash no pudo interpretar esto.  
## Verificar y convertir EOL (Fin de línea) de un archivo
Por supuesto, incluso si escribe un archivo en Windows, puede crear y convertir el archivo en formato UNIX (LF), no en formato PC (CRLF). También es posible lo contrario. La operación de conversión se denomina comúnmente "Conversión EOL (Fin de líneas)".  

De hecho, puede resultar un poco confuso cuando se encuentra por primera vez con las diferencias en el EOL para cada sistema operativo. Por lo tanto, las palabras clave relacionadas con el contenido que se explicará en el futuro se pueden asignar a una tabla como se muestra a continuación.  

|Nombre|ventanas|Ubuntu (Linux)|
| ------------------------------------------ | -------------------------------------- | -------------- |
|Terminología del formato de saltos de línea|CRLF (retorno de carro con avance de línea)|LF (avance de línea)|
|caracteres de representación de saltos de línea|`\r\n`|`\n`|
|Información de la herramienta `file` en Ubuntu|Texto ASCII, con terminadores de línea CRLF|texto ASCII|
|Tipo EOL en la herramienta Beyond Compare|ordenador personal|UNIX|
|Tipo EOL en Ubuntu|dos|Unix|
|Herramienta de conversión EOL en Ubuntu|unix2dos|dos2unix|

### ventanas
Usar el editor [Notepad++](https://notepad-plus-plus.org/downloads){:target="_blank"} puede ayudarle a crear archivos teniendo en cuenta el EOL.  

Como se muestra en la imagen a continuación, puede verificar el estado actual de "Conversión EOL" en el editor Notepad ++ y realizar la conversión. El menú está en "Editar> Conversión EOL".  
![Notepad++ - Conversión EOL - `Editar > Conversión EOL > Windows (CR LF) o Unix (LF)`](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-notepad++-eol_conversion-edit_eol_conversion_windows_cr_lf_or_unix_lf.png)  

Notepad++ - Conversión EOL - `Editar > Conversión EOL > Windows (CR LF) o Unix (LF)`
{: style="color:gray; font-size: 80%; text-align: center;"}

### Ubuntu (Linux)
En el entorno Ubuntu, también puedes comprobar el estado EOL de los archivos y convertirlos.  

Puede comprobar el estado EOL de un archivo utilizando la herramienta "archivo".  

```shell
# PC (CRLF)
$ file pc.txt 
pc.txt: ASCII text, with CRLF line terminators

# Unix (LF)
$ file unix.txt 
unix.txt: ASCII text
```
Para la conversión EOL de archivos, se deben instalar `tofrodos` y `dos2unix`. Se puede instalar usando `apt`.  

```shell
sudo apt-get install tofrodos
sudo apt-get install dos2unix
```
Una vez que instale los paquetes, puede utilizar las herramientas siguientes.  
- `dos2unix`: Convertir PC (CRLF) a Unix (LF)
- `unix2dos`: convierte Unix (LF) a PC (CRLF)

A continuación se muestra un ejemplo de conversión de PC (CRLF) a UNIX (LF).  

```shell
$ file pc.txt 
pc.txt: ASCII text, with CRLF line terminators

$ dos2unix pc.txt 
dos2unix: converting file pc.txt to Unix format...

$ file pc.txt 
pc.txt: ASCII text

```
## Sincronización EOL de Git Repo entre sistemas operativos
Hay una configuración de Git en un repositorio de Git que evita problemas de conversión EOL al confirmar y extraer archivos en entornos Windows y Ubuntu.  

El siguiente comando git cambia CRLF a LF antes de insertar un archivo en formato ASCII en la base de datos de objetos. Por lo tanto, se utiliza principalmente para la configuración de Git en un entorno "Windows".  

```shell
git config --global core.autocrlf input 
```
El siguiente comando git utiliza saltos de línea como LF. Por lo tanto, se utiliza principalmente en el entorno "Ubuntu (Linux)".  

```shell
git config --global core.autocrlf true
```
Dado que el comando anterior es una configuración global de Git, si desea que la configuración EOL se aplique solo a un repositorio clonado específico, puede ir a la carpeta del repositorio correspondiente y usar el comando eliminando solo la opción `--global`.  

En otras palabras, la intención es subir archivos con un EOL en formato LF al servidor Git.  

En un entorno Windows, puede acceder a Git Bash desde el menú después de hacer clic derecho.  
![Accediendo a Git Bash en Windows](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-accessing_git_bash_on_windows.png)  

Accediendo a Git Bash en Windows
{: style="color:gray; font-size: 80%; text-align: center;"}

