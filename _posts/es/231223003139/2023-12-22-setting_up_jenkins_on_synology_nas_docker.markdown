---
title:  Configuración de Jenkins en Synology NAS Docker
image:
  path: /assets/images/231223003139/es-thumb-unclesnote-setting_up_jenkins_on_synology_nas_docker.png
  alt: Configuración de Jenkins en Synology NAS Docker
images: ["/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-synology_nas_gui-docker-jenkins_port_settings.png", "/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-jenkins-getting_started.png"]
categories: [ubuntu, Jenkins, Ajustes]
tags: [ubuntu, Estibador, Jenkins, Ajustes]
description:  Hay muchas herramientas CI/CD (integración continua/implementación continua), y Jenkins es una de las herramientas útiles que no tiene restricciones de
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-23 00:31:39 +0900
ro_id: 231223003139
ro_name: setting_up_jenkins_on_synology_nas_docker
ro_ref: 231223003139/setting_up_jenkins_on_synology_nas_docker
lang: es
---
Hay muchas herramientas **CI/CD (integración continua/implementación continua)**, y Jenkins es una de las herramientas útiles que no tiene restricciones de licencia y es de código abierto. Me gustaría hablar sobre cómo instalar Jenkins en Synology NAS Docker.  
- https://pkg.jenkins.io/debian

## Entorno básico
Se requiere JDK versión 8 o superior para que Jenkins funcione. Instale JDK versión 11.  

```shell
apt-get update
apt-get install -y openjdk-11-jdk

java -version
# + --------------------------------------------------------
openjdk version "11.0.21" 2023-10-17
OpenJDK Runtime Environment (build 11.0.21+9-post-Ubuntu-0ubuntu120.04)
OpenJDK 64-Bit Server VM (build 11.0.21+9-post-Ubuntu-0ubuntu120.04, mixed mode, sharing)
# - --------------------------------------------------------

```
## Instalar el paquete Jenkins
Para instalar Jenkins usando APT, se debe agregar la información del servidor a APT. Después de agregar información del servidor Jenkins, se produce un error durante "apt update" que indica que no hay clave. Agregue la clave a `apt-key` usando la clave que se muestra en el mensaje de error. En mi caso la clave era `5BA31D57EF5975CA`.  

Una vez que haya agregado información clave a APT, instale Jenkins.  

```shell
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

apt-get update
# + --------------------------------------------------------
...
W: GPG error: https://pkg.jenkins.io/debian-stable binary/ Release: The following signatures couldnt be verified because the public key is not available: NO_PUBKEY 5BA31D57EF5975CA
E: The repository 'http://pkg.jenkins.io/debian-stable binary/ Release' is not signed.
...
# - --------------------------------------------------------

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA
# + --------------------------------------------------------
Executing: /tmp/apt-key-gpghome.d7qO7VDcMV/gpg.1.sh --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA
gpg: key 5BA31D57EF5975CA: public key "Jenkins Project <jenkinsci-board@googlegroups.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1
# - --------------------------------------------------------

apt-get update
# + --------------------------------------------------------
Ign:1 https://pkg.jenkins.io/debian-stable binary/ InRelease
Get:2 https://pkg.jenkins.io/debian-stable binary/ Release [2044 B]
Get:3 https://pkg.jenkins.io/debian-stable binary/ Release.gpg [833 B]
Hit:4 http://archive.ubuntu.com/ubuntu focal InRelease
Hit:5 http://archive.ubuntu.com/ubuntu focal-updates InRelease
Get:6 https://pkg.jenkins.io/debian-stable binary/ Packages [29.6 kB]
Hit:7 http://archive.ubuntu.com/ubuntu focal-backports InRelease
Hit:8 http://security.ubuntu.com/ubuntu focal-security InRelease
Fetched 32.5 kB in 2s (19.3 kB/s)
Reading package lists... Done
# - --------------------------------------------------------

apt-get install jenkins

```
El número de puerto para conectar Jenkins a la web se define en `HTTP_PORT` en el archivo `/etc/default/jenkins`. Si necesita cambiar el número de puerto, puede cambiarlo de `8080` al valor deseado.  

```shell

vi /etc/default/jenkins
# + --------------------------------------------------------
# port for HTTP connector (default 8080; disable with -1)
HTTP_PORT=8080
# - --------------------------------------------------------

```
## Configure el puerto del contenedor Synology NAS y ejecute Jenkins
Luego, detenga el contenedor de Ubuntu en la GUI de Synology NAS y configure el puerto para la conexión externa a Jenkins. Asigne el puerto "8080" del contenedor al puerto "48080".  

![GUI de Synology NAS - Docker - Configuración del puerto Jenkins](/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-synology_nas_gui-docker-jenkins_port_settings.png)
_GUI de Synology NAS - Docker - Configuración del puerto Jenkins_

Inicie el contenedor de Ubuntu y ejecute el servicio Jenkins. En resumen, si Ubuntu Docker se detiene y reinicia, debe ejecutar el servicio Jenkins nuevamente.  

```shell
sleep 10
service jenkins restart
```
Luego, conéctese a Jenkins mediante un navegador web. En mi caso, la dirección IP asignada a Synology NAS era "192.168.0.50" y el puerto era "48080" establecido anteriormente.  
- http://192.168.0.50:48080/


![Jenkins - Primeros pasos](/assets/images/231223003139/unclesnote-setting_up_jenkins_on_synology_nas_docker-jenkins-getting_started.png)
_Jenkins - Primeros pasos_

Inicie sesión con la contraseña inicial escrita en el archivo `/var/lib/jenkins/secrets/initialAdminPassword` y continúe con la instalación inicial de Jenkins.  

```shell
cat /var/lib/jenkins/secrets/initialAdminPassword
# + --------------------------------------------------------
72b349dadd5d4a83bac10060e536189e
# - --------------------------------------------------------
```
