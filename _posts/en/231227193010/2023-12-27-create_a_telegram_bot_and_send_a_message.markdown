---
title:  Create a Telegram bot and send a message
image:
  path: /assets/images/231227193010/en-thumb-unclesnote-create_a_telegram_bot_and_send_a_message.png
  alt: Create a Telegram bot and send a message
images: ["/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-search_botfather.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-botfather-newbot.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-enter_hello_on_bot_chat_room.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-internet_browser-telegram-getupdates.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-sendmessage_api.png"]
categories: [Ubuntu, Jenkins, Pipeline]
tags: [Ubuntu, Jenkins, Pipeline, sendMessage, getUpdates, Telegram]
description:  Telegram provides an API service that is relatively easy to use. Therefore, it can be used as an easy tool to notify events in CI/CD systems where security is
public: true
toc: false
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-27 19:30:10 +0900
ro_id: 231227193010
ro_name: create_a_telegram_bot_and_send_a_message
ro_ref: 231227193010/create_a_telegram_bot_and_send_a_message
lang: en
---
Telegram provides an API service that is relatively easy to use. Therefore, it can be used as an easy tool to notify events in CI/CD systems where security is not a major issue. I am trying to integrate Telegram into the Jenkins system, and I would like to introduce the basic method of creating a Telegram bot.  
## Overview
To send a Telegram message, `token` matching the Telegram bot and `chatid` indicating the chat room are required.  
- `token` : You can see this when creating a bot in Telegram
- `chatid` : Once you have found the token, you can find it by calling the Telegram API `getUpdates` using the token.

In conclusion, if you have found both the `token` and `chatid`, you can send an `im bot` message to the Telegram chat room by calling the URL below.  

```shell
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chatid>&text=im bot

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb
- chatid : 1230000000

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/sendMessage?chat_id=1230000000&text=im bot
```
## Create a Telegram bot - **token**
Find `botfather` on Telegram and enter the chat room. BotFather is a service bot that can create/manage Telegram bots.  

![Telegram - Search `BotFather`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-search_botfather.png)
_Telegram - Search `BotFather`_

Create a new bot using the `newbot` command.  

BotFather asks for the bot's name and username. In effect, `username` is the chat room where you will communicate with the bot. If a Telegram bot is successfully created, BotFather provides a `token`, which is an argument for communicating with the bot.  

![Telegram - `BotFather` - `newbot`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-botfather-newbot.png)
_Telegram - `BotFather` - `newbot`_

Token is the most basic credential for controlling bots using the Telegram API. Therefore, write it down carefully so that it is not made public.  
## Telegram **getUpdates** API call - **chatid**
If BotFather created a bot, find the bot in Telegram and send it a message. I sent a message saying `hello`.  

![Telegram - Enter `hello` on Bot' Chat Room](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-enter_hello_on_bot_chat_room.png)
_Telegram - Enter `hello` on Bot' Chat Room_

Then, in the web browser you use, such as Chrome or Edge, call the URL below by combining it with the token found when creating the bot above.  

```shell
https://api.telegram.org/bot<token>/getUpdates

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/getUpdates

```
Then, a string in JSON format will be displayed in the browser, and the `id` in `chat` will be the `chatid`. Take note of the `chatid`. If you use the Edge browser, you can see the line-aligned JSON string.  

![Internet Browser - Telegram - `getUpdates`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-internet_browser-telegram-getupdates.png)
_Internet Browser - Telegram - `getUpdates`_

## Send a Telegram message via browser - **sendMessage** API
In conclusion, we will use the Jenkins plugin to send a Telegram message, but for testing purposes we will send the message using the `sendMessage` Telegram API to the browser.  

The API is as follows, and you can send a Telegram message using the token and chatid found in the steps above.  

```shell
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chatid>&text=im bot

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb
- chatid : 1230000000

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/sendMessage?chat_id=1230000000&text=im bot
```
Did it work well? I was able to check the message `im bot` on Telegram as shown below.  

![Telegram - `sendMessage` API](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-sendmessage_api.png)
_Telegram - `sendMessage` API_

