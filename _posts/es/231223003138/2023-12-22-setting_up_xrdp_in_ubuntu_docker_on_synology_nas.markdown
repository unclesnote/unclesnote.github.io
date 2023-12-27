---
title:  Configuración de XRDP en Ubuntu Docker en Synology NAS
image:
  path: /assets/images/231223003138/es-thumb-unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas.png
  alt: Configuración de XRDP en Ubuntu Docker en Synology NAS
images: ["/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-virtualbox_port_forwarding_settings_for_xrdp_connection.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-remote_desktop_connection.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-package_center-docker.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-ubuntu_container-port_settings.png", "/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-mobaxterm-rdp_session.png"]
categories: [ubuntu, Estibador]
tags: [ubuntu, Estibador]
description:  Si compró un Synology NAS de nivel básico que admite la función VMM (Virtual Machine Manager), es posible que le haya gustado instalar Windows o Ubuntu en el
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-23 00:31:38 +0900
ro_id: 231223003138
ro_name: setting_up_xrdp_in_ubuntu_docker_on_synology_nas
ro_ref: 231223003138/setting_up_xrdp_in_ubuntu_docker_on_synology_nas
lang: es
---
Si compró un Synology NAS de nivel básico que admite la función VMM (Virtual Machine Manager), es posible que le haya gustado instalar Windows o Ubuntu en el VMM. Sin embargo, es posible que se sienta decepcionado por el largo tiempo de instalación y el bajo rendimiento.  

Para esas personas, instalar XRDP en Ubuntu Docker puede ser la mejor opción para habilitar el sistema operativo con una interfaz GUI.  

Explicaré dos métodos. Una es instalar XRDP en Docker de la máquina virtual de Ubuntu y la otra es crear un contenedor de Ubuntu en la aplicación Docker de Synology NAS y configurarlo para que sea accesible externamente a través de XRDP.  
## Contenedor acoplable XRDP en Ubuntu VM
### Cree una imagen de Docker y ejecute el contenedor
Crearemos una imagen de Docker basada en la siguiente información. Creemos `Dockerfile` con el contenido a continuación.  

```Dockerfile
FROM ubuntu:20.04

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y lubuntu-desktop

RUN rm /run/reboot-required*

RUN useradd -m testuser -p $(openssl passwd 1234)
RUN usermod -aG sudo testuser

RUN apt install -y xrdp
RUN adduser xrdp ssl-cert

RUN sed -i '3 a echo "\
export GNOME_SHELL_SESSION_MODE=Lubuntu\n\
export XDG_SESSION_TYPE=x11\n\
export XDG_CURRENT_DESKTOP=LXQt\n\
export XDG_CONFIG_DIRS=/etc/xdg/xdg-Lubuntu:/etc/xdg\n\
" > ~/.xsessionrc' /etc/xrdp/startwm.sh

EXPOSE 3389

CMD service xrdp start ; bash
```
Luego, crearemos una imagen de Docker basada en el `Dockerfile` creado. Luego, crearemos y ejecutaremos un contenedor con la imagen creada.  

```shell
# change permission of docker.sock if there is permission error when docker build
sudo chmod 666 /var/run/docker.sock;sudo chown -R ${USER}:users /var/run/docker.sock

# build docker image from Dockerfile
docker build -f Dockerfile -t img-xrdp-lubuntu .

# create docker container from image 
docker run -d -it --name cond-xrdp-lubuntu -p 3389:3389 img-xrdp-lubuntu

```
### Configuración de reenvío de puertos en VirtualBox
Si desea acceder a XRDP desde fuera de la máquina virtual al contenedor Docker de la VM de Ubuntu, debe configurar el reenvío de puertos en la VM de Ubuntu. Cuando intenta conectarse al puerto `43389` usando el protocolo RDP, esto se asigna al puerto `3389` dentro de la VM de Ubuntu.  

![Configuración de reenvío de puertos de VirtualBox para conexión XRDP](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-virtualbox_port_forwarding_settings_for_xrdp_connection.png)
_Configuración de reenvío de puertos de VirtualBox para conexión XRDP_

### Acceso remoto XRDP
Luego, conéctese a la dirección `127.0.0.1:43389` a través de una conexión de escritorio remoto.  

![Conexión de escritorio remoto](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-remote_desktop_connection.png)
_Conexión de escritorio remoto_

Luego, se abrirá la ventana de inicio de sesión de XRDP, ingrese el "nombre de usuario" y la "contraseña" a continuación.  

![Pantalla de inicio de sesión de Ubuntu XRDP](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png)
_Pantalla de inicio de sesión de Ubuntu XRDP_

- **username** : testuser
- **password** : 1234

## Contenedor Docker XRDP en Synology NAS
### Instalación del paquete Docker y configuración del puerto del contenedor
Acceda a la GUI de Synology NAS. Luego busque `Docker` en el Centro de paquetes e instálelo.  

![GUI de Synology NAS - Centro de paquetes - Docker](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-package_center-docker.png)
_GUI de Synology NAS - Centro de paquetes - Docker_

Descargué la imagen de Docker `ubuntu:20.04` y creé un contenedor basado en esa imagen. Y en la configuración del puerto del contenedor, se abrieron el puerto `422` para ssh y el puerto `43389` para XRDP.  

![GUI de Synology NAS - Contenedor Ubuntu - Configuración de puertos](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-synology_nas_gui-ubuntu_container-port_settings.png)
_GUI de Synology NAS - Contenedor Ubuntu - Configuración de puertos_

### Instalar paquetes ubuntu SSH y XRDP
Instale `openssh-server` siguiendo el siguiente comando. ssh será útil más adelante cuando acceda de forma remota al contenedor acoplable de Ubuntu.  

```shell
apt update
apt install openssh-server
apt install -y net-tools
apt install -y vim

vim /etc/ssh/sshd_config
# ----------------------------------------------
# enable `PermitRootLogin` and set it to `yes`
PermitRootLogin yes
# ----------------------------------------------

passwd root 
# ----------------------------------------------
# it will be ssh login password, i have set it as `0000`
0000
# ----------------------------------------------

service ssh start
```
Luego, instale los paquetes para XRDP siguiendo el siguiente comando. Probablemente verá muchos mensajes de error al instalar XRDP siguiendo el siguiente comando. Este es un error relacionado con dependencias de hardware como sonido y USB, etc., al instalar "lubuntu-desktop". Ignore el mensaje de error y continúe.  

```shell
apt update && DEBIAN_FRONTEND=noninteractive apt install -y lubuntu-desktop
rm /run/reboot-required*
useradd -m testuser -p $(openssl passwd 1234)
usermod -aG sudo testuser
apt install -y xrdp
adduser xrdp ssl-cert

sed -i '3 a echo "\
export GNOME_SHELL_SESSION_MODE=Lubuntu\n\
export XDG_SESSION_TYPE=x11\n\
export XDG_CURRENT_DESKTOP=LXQt\n\
export XDG_CONFIG_DIRS=/etc/xdg/xdg-Lubuntu:/etc/xdg\n\
" > ~/.xsessionrc' /etc/xrdp/startwm.sh

service xrdp start

```
### Acceso remoto XRDP
Conéctese a XRDP utilizando la dirección IP asignada a su Synology NAS y conéctese al puerto `43389` configurado anteriormente.  

![MobaXterm - Sesión RDP](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-mobaxterm-rdp_session.png)
_MobaXterm - Sesión RDP_

Luego, se abrirá la ventana de inicio de sesión de XRDP, ingrese el "nombre de usuario" y la "contraseña" a continuación.  

![Pantalla de inicio de sesión de Ubuntu XRDP](/assets/images/231223003138/unclesnote-setting_up_xrdp_in_ubuntu_docker_on_synology_nas-ubuntu_xrdp_login_screen.png)
_Pantalla de inicio de sesión de Ubuntu XRDP_

- **username** : testuser
- **password** : 1234

Si el contenedor Docker se detiene y reinicia, los servicios ssh y xrdp se deben ejecutar nuevamente.  

No sé el motivo exacto, pero una vez que se inició el servicio xrdp, tuvo que reiniciarse después de un retraso para que xrdp funcionara normalmente. Y desde la segunda conexión xrdp, la barra de menú inferior se mostró en la GUI. Puede guardar y utilizar el contenido siguiente como un script bash.  

```bash
echo "start ssh.."
service ssh start

echo "start xrdp.."
rm /var/run/xrdp/xrdp-sesman.pid
service xrdp start
echo "sleep 10 sec.. "
sleep 10
echo "restart xrdp"
service xrdp restart

```
## Referencia
- https://youtu.be/0rl5145aEMk?si=aoO3eZyDLPnmCfr
