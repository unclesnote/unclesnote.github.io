---
title:  텔레그램 봇을 생성하고 메시지 보내기
image:
  path: /assets/images/231227193010/ko-thumb-unclesnote-create_a_telegram_bot_and_send_a_message.png
  alt: 텔레그램 봇을 생성하고 메시지 보내기
images: ["/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-search_botfather.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-botfather-newbot.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-enter_hello_on_bot_chat_room.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-internet_browser-telegram-getupdates.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-sendmessage_api.png"]
categories: [우분투, 젠킨스, Pipeline]
tags: [우분투, 젠킨스, Pipeline, sendMessage, getUpdates, Telegram]
description:  텔레그램은 비교적 사용하기 쉬운 API 서비스를 제공합니다. 따라서 보안이 큰 문제가 되지 않는 CI/CD 시스템에서 이벤트를 알리는 쉬운 도구로 사용할 수 있습니다. 젠킨스 시스템에 텔레그램을 통합하려고 하는데, 텔레그램 봇을 만드는 기본적인 방법을 소개하려고 합니다.
public: true
toc: false
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-27 19:30:10 +0900
ro_id: 231227193010
ro_name: create_a_telegram_bot_and_send_a_message
ro_ref: 231227193010/create_a_telegram_bot_and_send_a_message
lang: ko
---
텔레그램은 비교적 사용하기 쉬운 API 서비스를 제공합니다. 따라서 보안이 큰 문제가 되지 않는 CI/CD 시스템에서 이벤트를 알리는 쉬운 도구로 사용할 수 있습니다. 젠킨스 시스템에 텔레그램을 통합하려고 하는데, 텔레그램 봇을 만드는 기본적인 방법을 소개하려고 합니다.  
## 개요
텔레그램 메시지를 보내기 위해서는 텔레그램 봇과 일치하는 `token`과 채팅방을 나타내는 `chatid`가 필요합니다.  
- `token` : 텔레그램에서 봇을 생성할 때 볼 수 있습니다.
- `chatid` : 토큰을 찾으면 해당 토큰을 사용하여 Telegram API `getUpdates`를 호출하여 찾을 수 있습니다.

결론적으로 `token`과 `chatid`를 모두 찾았다면 아래 URL을 호출하여 텔레그램 채팅방에 `im bot` 메시지를 보낼 수 있습니다.  

```shell
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chatid>&text=im bot

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb
- chatid : 1230000000

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/sendMessage?chat_id=1230000000&text=im bot
```
## 텔레그램 봇 만들기 - **토큰**
텔레그램에서 `botfather`를 찾아 채팅방에 입장하세요. BotFather는 텔레그램 봇을 생성/관리할 수 있는 서비스 봇입니다.  

![텔레그램 - `BotFather` 검색](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-search_botfather.png)
_텔레그램 - `BotFather` 검색_

`newbot` 명령을 사용하여 새 봇을 만듭니다.  

BotFather는 봇의 이름과 사용자 이름을 묻습니다. 실제로 `사용자 이름`은 봇과 통신할 채팅방입니다. 텔레그램 봇이 성공적으로 생성되면 BotFather는 봇과 통신하기 위한 인수인 `토큰`을 제공합니다.  

![텔레그램 - `BotFather` - `newbot`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-botfather-newbot.png)
_텔레그램 - `BotFather` - `newbot`_

토큰은 Telegram API를 사용하여 봇을 제어하기 위한 가장 기본적인 자격 증명입니다. 그러므로 공개되지 않도록 주의해서 적어 주십시오.  
## 텔레그램 **getUpdates** API 호출 - **chatid**
BotFather가 봇을 생성한 경우 Telegram에서 봇을 찾아 메시지를 보내세요. 안녕하세요`라고 문자를 보냈어요.  

![텔레그램 - 봇 채팅방에 `hello`를 입력하세요](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-enter_hello_on_bot_chat_room.png)
_텔레그램 - 봇 채팅방에 `hello`를 입력하세요_

그런 다음 Chrome이나 Edge 등 사용하는 웹 브라우저에서 위의 봇 생성 시 찾은 토큰과 결합하여 아래 URL을 호출합니다.  

```shell
https://api.telegram.org/bot<token>/getUpdates

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/getUpdates

```
그러면 JSON 형식의 문자열이 브라우저에 표시되고 `chat`의 `id`는 `chatid`가 됩니다. `chatid`에 주목하세요. Edge 브라우저를 사용하면 줄 정렬된 JSON 문자열을 볼 수 있습니다.  

![인터넷 브라우저 - 텔레그램 - `getUpdates`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-internet_browser-telegram-getupdates.png)
_인터넷 브라우저 - 텔레그램 - `getUpdates`_

## 브라우저를 통해 텔레그램 메시지 보내기 - **sendMessage** API
결론적으로 Jenkins 플러그인을 사용하여 텔레그램 메시지를 보내지만 테스트 목적으로 `sendMessage` 텔레그램 API를 사용하여 브라우저에 메시지를 보냅니다.  

API는 다음과 같으며, 위 단계에서 찾은 토큰과 chatid를 이용하여 텔레그램 메시지를 보낼 수 있습니다.  

```shell
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chatid>&text=im bot

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb
- chatid : 1230000000

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/sendMessage?chat_id=1230000000&text=im bot
```
잘 작동했나요? 아래와 같이 텔레그램에서 `im bot`이라는 메시지를 확인할 수 있었습니다.  

![텔레그램 - `sendMessage` API](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-sendmessage_api.png)
_텔레그램 - `sendMessage` API_

