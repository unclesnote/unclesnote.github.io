---
title:  Crea un bot de Telegram y envía un mensaje
image:
  path: /assets/images/231227193010/es-thumb-unclesnote-create_a_telegram_bot_and_send_a_message.png
  alt: Crea un bot de Telegram y envía un mensaje
images: ["/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-search_botfather.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-botfather-newbot.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-enter_hello_on_bot_chat_room.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-internet_browser-telegram-getupdates.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-sendmessage_api.png"]
categories: [ubuntu, Jenkins, Tubería]
tags: [ubuntu, Jenkins, Tubería, sendMessage, getUpdates, Telegram]
description:  Telegram proporciona un servicio API que es relativamente fácil de usar. Por lo tanto, se puede utilizar como una herramienta sencilla para notificar eventos
public: true
toc: false
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-27 19:30:10 +0900
ro_id: 231227193010
ro_name: create_a_telegram_bot_and_send_a_message
ro_ref: 231227193010/create_a_telegram_bot_and_send_a_message
lang: es
---
Telegram proporciona un servicio API que es relativamente fácil de usar. Por lo tanto, se puede utilizar como una herramienta sencilla para notificar eventos en sistemas CI/CD donde la seguridad no es un problema importante. Estoy intentando integrar Telegram en el sistema Jenkins y me gustaría presentarles el método básico para crear un bot de Telegram.  
## Descripción general
Para enviar un mensaje de Telegram, se requiere un "token" que coincida con el bot de Telegram y un "chatid" que indique la sala de chat.  
- `token`: Puedes ver esto al crear un bot en Telegram
- `chatid`: una vez que haya encontrado el token, puede encontrarlo llamando a la API de Telegram `getUpdates` usando el token.

En conclusión, si ha encontrado tanto el "token" como el "chatid", puede enviar un mensaje "im bot" a la sala de chat de Telegram llamando a la siguiente URL.  

```shell
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chatid>&text=im bot

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb
- chatid : 1230000000

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/sendMessage?chat_id=1230000000&text=im bot
```
## Crear un bot de Telegram - **token**
Encuentra "botfather" en Telegram y entra a la sala de chat. BotFather es un bot de servicio que puede crear/administrar bots de Telegram.  

![Telegram - Buscar `BotFather`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-search_botfather.png)
_Telegram - Buscar `BotFather`_

Crea un nuevo bot usando el comando `newbot`.  

BotFather solicita el nombre y el nombre de usuario del bot. En efecto, "nombre de usuario" es la sala de chat donde te comunicarás con el bot. Si un bot de Telegram se crea con éxito, BotFather proporciona un "token", que es un argumento para comunicarse con el bot.  

![Telegrama - `BotFather` - `newbot`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-botfather-newbot.png)
_Telegrama - `BotFather` - `newbot`_

Token es la credencial más básica para controlar bots utilizando la API de Telegram. Por tanto, anótalo con cuidado para que no se haga público.  
## Llamada API de Telegram **getUpdates** - **chatid**
Si BotFather creó un bot, búsquelo en Telegram y envíele un mensaje. Envié un mensaje diciendo "hola".  

![Telegram: ingresa "hola" en la sala de chat de Bot](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-enter_hello_on_bot_chat_room.png)
_Telegram: ingresa "hola" en la sala de chat de Bot_

Luego, en el navegador web que utiliza, como Chrome o Edge, llame a la siguiente URL combinándola con el token que se encuentra al crear el bot anterior.  

```shell
https://api.telegram.org/bot<token>/getUpdates

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/getUpdates

```
Luego, se mostrará una cadena en formato JSON en el navegador, y el `id` en `chat` será el `chatid`. Tome nota del `chatid`. Si utiliza el navegador Edge, puede ver la cadena JSON alineada con líneas.  

![Navegador de Internet - Telegram - `getUpdates`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-internet_browser-telegram-getupdates.png)
_Navegador de Internet - Telegram - `getUpdates`_

## Enviar un mensaje de Telegram a través del navegador - API **sendMessage**
En conclusión, usaremos el complemento Jenkins para enviar un mensaje de Telegram, pero para fines de prueba enviaremos el mensaje usando la API de Telegram `sendMessage` al navegador.  

La API es la siguiente y puede enviar un mensaje de Telegram utilizando el token y el chatid que se encuentran en los pasos anteriores.  

```shell
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chatid>&text=im bot

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb
- chatid : 1230000000

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/sendMessage?chat_id=1230000000&text=im bot
```
¿Funcionó bien? Pude verificar el mensaje "im bot" en Telegram como se muestra a continuación.  

![Telegrama - API `sendMessage`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-sendmessage_api.png)
_Telegrama - API `sendMessage`_

