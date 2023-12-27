---
title:  创建 Telegram 机器人并发送消息
image:
  path: /assets/images/231227193010/zh-thumb-unclesnote-create_a_telegram_bot_and_send_a_message.png
  alt: 创建 Telegram 机器人并发送消息
images: ["/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-search_botfather.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-botfather-newbot.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-enter_hello_on_bot_chat_room.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-internet_browser-telegram-getupdates.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-sendmessage_api.png"]
categories: [乌班图, 詹金斯, 管道]
tags: [乌班图, 詹金斯, 管道, sendMessage, getUpdates, Telegram]
description:  Telegram提供了相对容易使用的API服务。因此，它可以用作通知 CI/CD 系统中的事件的简单工具，其中安全性不是主要问题。我正在尝试将 Telegram 集成到 Jenkins 系统中，我想介绍一下创建 Telegram 机器人的基本方法。
public: true
toc: false
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-27 19:30:10 +0900
ro_id: 231227193010
ro_name: create_a_telegram_bot_and_send_a_message
ro_ref: 231227193010/create_a_telegram_bot_and_send_a_message
lang: zh
---
Telegram提供了相对容易使用的API服务。因此，它可以用作通知 CI/CD 系统中的事件的简单工具，其中安全性不是主要问题。我正在尝试将 Telegram 集成到 Jenkins 系统中，我想介绍一下创建 Telegram 机器人的基本方法。  
## 概述
要发送 Telegram 消息，需要与 Telegram 机器人匹配的`token`和指示聊天室的`chatid`。  
- `token` ：您在 Telegram 中创建机器人时可以看到这个
- `chatid` ：找到令牌后，您可以使用令牌调用 Telegram API `getUpdates` 来找到它。

总之，如果您同时找到了`token`和`chatid`，则可以通过调用以下 URL 向 Telegram 聊天室发送一条`im bot`消息。  

```shell
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chatid>&text=im bot

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb
- chatid : 1230000000

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/sendMessage?chat_id=1230000000&text=im bot
```
## 创建 Telegram 机器人 - **令牌**
在 Telegram 上找到`botfather`并进入聊天室。 BotFather 是一个服务机器人，可以创建/管理 Telegram 机器人。  

![Telegram - 搜索`BotFather`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-search_botfather.png)
_Telegram - 搜索`BotFather`_

使用`newbot`命令创建一个新机器人。  

BotFather 询问机器人的名称和用户名。实际上，`用户名`是您与机器人进行通信的聊天室。如果成功创建 Telegram 机器人，BotFather 会提供一个`令牌`，它是与机器人通信的参数。  

![Telegram - `BotFather` - `newbot`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-botfather-newbot.png)
_Telegram - `BotFather` - `newbot`_

Token是使用Telegram API控制机器人的最基本凭证。因此，请仔细记录下来，以免被公开。  
## Telegram **getUpdates** API 调用 - **chatid**
如果 BotFather 创建了一个机器人，请在 Telegram 中找到该机器人并向其发送消息。我发了一条消息说`你好`。  

![Telegram - 在 Bot 聊天室输入`hello`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-enter_hello_on_bot_chat_room.png)
_Telegram - 在 Bot 聊天室输入`hello`_

然后，在您使用的 Web 浏览器(例如 Chrome 或 Edge)中，通过将下面的 URL 与创建上面的机器人时找到的令牌相结合来调用下面的 URL。  

```shell
https://api.telegram.org/bot<token>/getUpdates

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/getUpdates

```
然后浏览器中会显示一个JSON格式的字符串，`chat`中的`id`就是`chatid`。注意`chatid`。如果您使用 Edge 浏览器，您可以看到行对齐的 JSON 字符串。  

![互联网浏览器 - Telegram - `getUpdates`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-internet_browser-telegram-getupdates.png)
_互联网浏览器 - Telegram - `getUpdates`_

## 通过浏览器发送 Telegram 消息 - **sendMessage** API
总之，我们将使用 Jenkins 插件发送 Telegram 消息，但出于测试目的，我们将使用 `sendMessage` Telegram API 将消息发送到浏览器。  

API如下，您可以使用上述步骤中找到的token和chatid发送Telegram消息。  

```shell
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chatid>&text=im bot

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb
- chatid : 1230000000

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/sendMessage?chat_id=1230000000&text=im bot
```
效果好吗？我能够在 Telegram 上查看消息`im bot`，如下所示。  

![Telegram - `sendMessage` API](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-sendmessage_api.png)
_Telegram - `sendMessage` API_

