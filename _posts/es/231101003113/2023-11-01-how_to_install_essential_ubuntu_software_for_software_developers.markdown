---
title:  Cómo instalar software de Ubuntu esencial para desarrolladores de software
image:
  path: /assets/images/231101003113/es-thumb-basic_setting_-_developer-visual-studio-code.png
  alt: Cómo instalar software de Ubuntu esencial para desarrolladores de software
images: ["/assets/images/231101003113/basic_setting_-_developer-visual-studio-code.png", "/assets/images/231101003113/basic_setting_-_developer-github-desktop.png", "/assets/images/231101003113/basic_setting_-_developer-beyond-compare-4.png", "/assets/images/231101003113/basic_setting_-_developer-sqlite-db-browser.png"]
categories: [ubuntu, Herramientas]
tags: [CódigoVisualStudio, CódigoVS, GitHubEscritorio, Másalládecomparar4, NavegadorSQLiteDBB, BancodetrabajoMySQL, ubuntu, Herramientas]
description:  Si es un desarrollador de software y su entorno de desarrollo es Ubuntu, le explicaremos cómo instalar el software esencial de Ubuntu que necesita instalar.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-01 00:31:13 +0900
ro_id: 231101003113
ro_name: how_to_install_essential_ubuntu_software_for_software_developers
ro_ref: 231101003113/how_to_install_essential_ubuntu_software_for_software_developers
lang: es
---
Si es un desarrollador de software y su entorno de desarrollo es Ubuntu, le explicaremos cómo instalar el software esencial de Ubuntu que necesita instalar.  
## Código de estudio visual
![Código de estudio visual](/assets/images/231101003113/basic_setting_-_developer-visual-studio-code.png)  

Código de estudio visual
{: style="color:gray; font-size: 80%; text-align: center;"}

[Visual Studio Code](https://code.visualstudio.com){:target="_blank"} es un IDE y editor ampliamente utilizado en el desarrollo de software.  
Si está utilizando "el entorno GUI de escritorio de Ubuntu (GNOME)", puede descargar VS Code usando el navegador integrado e instalarlo usando la herramienta "dpkg".  

```shell
cd ~/Downloads
sudo dpkg -i code_1.83.0-1696350811_amd64.deb
```
Si está utilizando "un entorno de servidor Ubuntu" o "solo tiene acceso SSH", esto es un poco complicado. Sin embargo, puede instalar VS Code usando los siguientes comandos.  

```shell
# Install basic packages for installation
sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
# Install the Microsoft GPG key and add the repository to apt
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
# Install VS Code
sudo apt update
sudo apt install code
```
Puede instalar la extensión para acceso remoto a VS Code a través de SSH usando el siguiente comando.  

```shell
code --install-extension ms-vscode-remote.remote-ssh
```
## Escritorio GitHub
![Escritorio GitHub](/assets/images/231101003113/basic_setting_-_developer-github-desktop.png)  

Escritorio GitHub
{: style="color:gray; font-size: 80%; text-align: center;"}

El software de escritorio GitHub es un cliente Git. Si está trabajando en un proyecto de GitHub, esta es definitivamente una buena opción, pero incluso si usa un servidor git personal en lugar de un repositorio de GitHub, también puede ser una buena opción si no necesita funciones complejas.  
El sitio [El escritorio oficial de GitHub](https://desktop.github.com/){:target="_blank"} solo proporciona versiones para Windows y macOS. Sin embargo, debido a que GitHub Desktop es un proyecto de código abierto, la versión de Ubuntu también se distribuye en un [repositorio] separado (https://github.com/shiftkey/desktop). No estoy seguro si esto es oficial. Después de agregar el repositorio a apt, puede instalar GitHub Desktop usando apt.  

```shell
wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/mwt-desktop.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" > /etc/apt/sources.list.d/mwt-desktop.list'
sudo apt update && sudo apt install github-desktop
```
## Más allá de comparar 4
![Más allá de comparar 4](/assets/images/231101003113/basic_setting_-_developer-beyond-compare-4.png)  

Más allá de comparar 4
{: style="color:gray; font-size: 80%; text-align: center;"}

Beyond Compare es una popular herramienta de comparación de archivos.  
Desafortunadamente, la versión Beyond Compare 3 no tiene un buen rendimiento de comparación de archivos en Ubuntu. En otras palabras, la comparación de archivos lleva mucho tiempo. Sin embargo, la última versión, [Beyond Compare 4](https://www.scootersoftware.com/download){:target="_blank"} es rápida y tiene el mismo rendimiento que Windows en Ubuntu. Entonces, recomiendo elegir la versión 4 en Ubuntu.  
Puede descargar Beyond Compare 4 desde el sitio web oficial usando un navegador web, pero lo descargaremos usando la herramienta `wget`.  

```shell
wget https://www.scootersoftware.com/files/bcompare-4.4.6.27483_amd64.deb
sudo dpkg -i bcompare-4.4.6.27483_amd64.deb
rm bcompare-4.4.6.27483_amd64.deb
```
Una vez que se complete la instalación, reinicie Beyond Compare 4 usando el siguiente comando.  

```shell
sudo rm -rf ~/.config/bcompare #thinks bensonkb
sudo sed -i "s/keexjEP3t4Mue23hrnuPtY4TdcsqNiJL-5174TsUdLmJSIXKfG2NGPwBL6vnRPddT7tH29qpkneX63DO9ECSPE9rzY1zhThHERg8lHM9IBFT+rVuiY823aQJuqzxCKIE1bcDqM4wgW01FH6oCBP1G4ub01xmb4BGSUG6ZrjxWHJyNLyIlGvOhoY2HAYzEtzYGwxFZn2JZ66o4RONkXjX0DF9EzsdUef3UAS+JQ+fCYReLawdjEe6tXCv88GKaaPKWxCeaUL9PejICQgRQOLGOZtZQkLgAelrOtehxz5ANOOqCaJgy2mJLQVLM5SJ9Dli909c5ybvEhVmIC0dc9dWH+/N9KmiLVlKMU7RJqnE+WXEEPI1SgglmfmLc1yVH7dqBb9ehOoKG9UE+HAE1YvH1XX2XVGeEqYUY-Tsk7YBTz0WpSpoYyPgx6Iki5KLtQ5G-aKP9eysnkuOAkrvHU8bLbGtZteGwJarev03PhfCioJL4OSqsmQGEvDbHFEbNl1qJtdwEriR+VNZts9vNNLk7UGfeNwIiqpxjk4Mn09nmSd8FhM4ifvcaIbNCRoMPGl6KU12iseSe+w+1kFsLhX+OhQM8WXcWV10cGqBzQE9OqOLUcg9n0krrR3KrohstS9smTwEx9olyLYppvC0p5i7dAx2deWvM1ZxKNs0BvcXGukR+/g" /usr/lib/beyondcompare/BCompare
```
Luego ejecute Beyond Compare 4 desde la GUI de Ubuntu e ingrese la clave de licencia si la tiene.  

```shell
# Then restart BC, click "Enter License":
ayvZeJDYPBHS4J-1K6g6bDBuPoo0G-oGAq35blZtAoRqC-qQeSz28XAzX
6nTx9laTMLRCp6nAIhHNGZ2ehkeUfbnFaxEeLvI8fJavn-XQLNbOumCLU
qgdNbNMZiFRU03+OTQnw4V-E2YKTYi-LkgPzE6R-yIJGDNWfxH2AdpIgg
8rlpsbrTs9Dt1zysUfvAEi0dKbmGIi3rqf7yWmwDh1AI5VyoWFIejvJwJ
Lmlr2CjQ1VZ3DySCfBDuKcYmOCeK7jzEWPUnAw+f9360nIiiNEB0YGkwB
kdtgaKEEik7aNiI3jXvp5r34wViVJCiX7m2y7pqBV9gZIvP9hP9KPnP++++
```
Si no tiene una clave de licencia, es posible que deba realizar el proceso de restablecimiento nuevamente cuando finalice el período de evaluación. Por lo tanto, recomiendo guardar y usar el espacio de trabajo y exportar la configuración cada vez que se actualice y guardarlo como un archivo.  
## Base de datos
### Navegador de base de datos para SQLite
![Navegador de base de datos para SQLite](/assets/images/231101003113/basic_setting_-_developer-sqlite-db-browser.png)  

Navegador de base de datos para SQLite
{: style="color:gray; font-size: 80%; text-align: center;"}

Si utiliza SQLite DB, [SQLite DB Browser](https://sqlitebrowser.org/dl/){:target="_blank"} es un software esencial para consultar la base de datos o ver el contenido de la tabla en un entorno GUI.  
Puede agregar el repositorio `sqlitebrowser` para apt e instalar el navegador SQLite DB.  

```shell
sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser
sudo apt-get update
sudo apt-get install sqlitebrowser
```
### Banco de trabajo MySQL
Describiré esto más adelante cuando necesite instalar MySQL Workbench en Ubuntu.  
