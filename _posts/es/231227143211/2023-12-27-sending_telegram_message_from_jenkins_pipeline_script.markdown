---
title:  Envío de mensajes de Telegram desde el script de canalización de Jenkins
image:
  path: /assets/images/231227143211/es-thumb-unclesnote-sending_telegram_message_from_jenkins_pipeline_script.png
  alt: Envío de mensajes de Telegram desde el script de canalización de Jenkins
images: ["/assets/images/231227143211/unclesnote-sending_telegram_message_from_jenkins_pipeline_script-jenkins-telegram_plugins.png"]
categories: [ubuntu, Jenkins, Tubería]
tags: [jenkins, telegrama, curl, ubuntu, Jenkins, Tubería]
description:  Por supuesto, existen complementos de Telegram para Jenkins, pero yo personalmente no quería pasar por prueba y error. Han pasado al menos dos años desde que
public: true
toc: false
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-27 14:32:11 +0900
ro_id: 231227143211
ro_name: sending_telegram_message_from_jenkins_pipeline_script
ro_ref: 231227143211/sending_telegram_message_from_jenkins_pipeline_script
lang: es
---
Por supuesto, existen complementos de Telegram para Jenkins, pero yo personalmente no quería pasar por prueba y error. Han pasado al menos dos años desde que se lanzaron los complementos. Enviaré un mensaje de telegrama usando `curl` en Linux.  

![Jenkins - Complementos de Telegram](/assets/images/231227143211/unclesnote-sending_telegram_message_from_jenkins_pipeline_script-jenkins-telegram_plugins.png)
_Jenkins - Complementos de Telegram_

## Funciones geniales para enviar mensajes de Telegram
Creé dos funciones Groovy para usar en el script de Jenkins. `func_telegram_sendMessage_message` es una función que envía un mensaje de Telegram simplemente insertando una cadena. Otro `func_telegram_sendMessage_file` es una función que envía el contenido de un archivo de texto como un mensaje de Telegram.  

```groovy
// -----------------------------------------------
// func_telegram_sendMessage_message
// -----------------------------------------------
def func_telegram_sendMessage_message(title, message, token, chatid) {
    echo "### func_telegram_sendMessage_message, title=${title}, message=${message}, token=${token}, chatid=${chatid}"

    try {
        sh """
        curl -X POST \
                -d chat_id=${chatid} \
                -d parse_mode=HTML \
                -d text='<b>${title}</b>\n\n${message}' \
                https://api.telegram.org/bot${token}/sendMessage
        """
    } catch(Exception e) {
        currentBuild.result = 'SUCCESS'
    }
}

// -----------------------------------------------
// func_telegram_sendMessage_fileContents
// -----------------------------------------------
def func_telegram_sendMessage_fileContents(title, file, token, chatid) {
    echo "### func_telegram_sendMessage_file, title=${title}, file=${file}, token=${token}, chatid=${chatid}"

    boolean isFileExist = true
    def filecontents = ""
    if (fileExists("${file}") == true) {
        def filetext = sh(script: "cat ${file}", returnStdout: true).trim()
        filecontents = "<b>${file}</b>\n${filetext}"
    } else {
        filecontents = "<b>${file}</b>\nFile does not exist"
        isFileExist = false
    }

    func_telegram_sendMessage_message(title, filecontents, token, chatid)

    return isFileExist
}

// -----------------------------------------------
// func_telegram_sendDocument_file
// -----------------------------------------------
def func_telegram_sendDocument_file(file, token, chatid) {
    echo "### func_telegram_sendMessage_file, file=${file}, token=${token}, chatid=${chatid}"

    if (fileExists("${file}") == false) {
        return false
    }

    try {
        sh """
        curl -k \
        -F chat_id=${chatid} \
        -F document=@\"${file}\" \
                https://api.telegram.org/bot${token}/sendDocument
        """
    } catch(Exception e) {
        currentBuild.result = 'SUCCESS'
        return false
    }

    return true
}
```
Aunque todavía no encontré ningún error al enviar un mensaje de Telegram a través de "curl", envolví la declaración curl con una declaración "try-catch" para evitar que el proceso de canalización se detuviera debido a un error. Personalmente, creo que el procesamiento de la canalización tiene mayor prioridad que enviar un mensaje de Telegram.  
## Usar funciones dentro de **pasos** de una **tubería**
A continuación se muestra cómo llamar a la función creada anteriormente en los "pasos" del "canalización". Codifiqué el "token" y el "chatid" del bot de Telegram. Si surge la necesidad más adelante, intentaré implementarlo usando la función "Credenciales" de Jenkins.  

```groovy
steps {
    script {
        def token = g_si.TELEGRAM_TOKEN;
        def chatid = g_si.TELEGRAM_CHATID;
        
        func_telegram_sendMessage_message("title", "im message", token, chatid)
        func_telegram_sendMessage_file("file title", "./_report/aa.txt", chatid, chatid)
        
        func_telegram_sendMessage_message("im title", "im message", token, chatid)
        def rst = func_telegram_sendMessage_fileContents("im file title", "./_report/aa.txt", token, chatid)
        if (rst == true ) {
            func_telegram_sendMessage_file("./_report/aa.txt", token, chatid)
        }                        
    }
}

```
