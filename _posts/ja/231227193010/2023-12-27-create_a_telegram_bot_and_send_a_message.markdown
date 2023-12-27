---
title:  Telegram ボットを作成してメッセージを送信する
image:
  path: /assets/images/231227193010/ja-thumb-unclesnote-create_a_telegram_bot_and_send_a_message.png
  alt: Telegram ボットを作成してメッセージを送信する
images: ["/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-search_botfather.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-botfather-newbot.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-enter_hello_on_bot_chat_room.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-internet_browser-telegram-getupdates.png", "/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-sendmessage_api.png"]
categories: [Ubuntu, ジェンキンス, パイプライン]
tags: [Ubuntu, ジェンキンス, パイプライン, sendMessage, getUpdates, Telegram]
description:  Telegram は、比較的使いやすい API サービスを提供します。したがって、セキュリティが大きな問題ではない CI/CD システムでイベントを通知する簡単なツールとして使用できます。 Telegram を Jenkins システムに統合しようとしているのですが、Telegram ボットの基本的な作成方法を紹介し
public: true
toc: false
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-27 19:30:10 +0900
ro_id: 231227193010
ro_name: create_a_telegram_bot_and_send_a_message
ro_ref: 231227193010/create_a_telegram_bot_and_send_a_message
lang: ja
---
Telegram は、比較的使いやすい API サービスを提供します。したがって、セキュリティが大きな問題ではない CI/CD システムでイベントを通知する簡単なツールとして使用できます。 Telegram を Jenkins システムに統合しようとしているのですが、Telegram ボットの基本的な作成方法を紹介したいと思います。  
## 概要
Telegram メッセージを送信するには、Telegram ボットに一致する `token` とチャット ルームを示す `chatid` が必要です。  
- `token` : Telegram でボットを作成するときにこれを確認できます。
- `chatid` : トークンを見つけたら、そのトークンを使用して Telegram API `getUpdates` を呼び出すことでそれを見つけることができます。

結論として、`token` と `chatid` の両方が見つかった場合は、以下の URL を呼び出して Telegram チャット ルームに `im bot` メッセージを送信できます。  

```shell
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chatid>&text=im bot

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb
- chatid : 1230000000

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/sendMessage?chat_id=1230000000&text=im bot
```
## Telegram ボットの作成 - **トークン**
Telegram で`botfather`を見つけて、チャット ルームに入ります。 BotFather は、Telegram ボットを作成/管理できるサービス ボットです。  

![電報 - `BotFather`を検索](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-search_botfather.png)
_電報 - `BotFather`を検索_

`newbot`コマンドを使用して新しいボットを作成します。  

BotFather はボットの名前とユーザー名を尋ねます。実際、`username`はボットと通信するチャット ルームです。 Telegram ボットが正常に作成されると、BotFather はボットと通信するための引数である`トークン`を提供します。  

![電報 - `BotFather` - `newbot`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-botfather-newbot.png)
_電報 - `BotFather` - `newbot`_

トークンは、Telegram API を使用してボットを制御するための最も基本的な認証情報です。したがって、公開されないように慎重に書き留めてください。  
## Telegram **getUpdates** API 呼び出し - **chatid**
BotFather がボットを作成した場合は、Telegram でボットを見つけてメッセージを送信します。 `こんにちは`とメッセージを送りました。  

![Telegram - Bot チャット ルームに`hello`と入力してください](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-enter_hello_on_bot_chat_room.png)
_Telegram - Bot チャット ルームに`hello`と入力してください_

次に、Chrome や Edge などの使用する Web ブラウザーで、上記のボットの作成時に見つかったトークンと組み合わせて、以下の URL を呼び出します。  

```shell
https://api.telegram.org/bot<token>/getUpdates

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/getUpdates

```
するとブラウザにはJSON形式の文字列が表示され、`chat`の`id`が`chatid`となります。 `chatid`に注目してください。 Edge ブラウザを使用すると、行揃えされた JSON 文字列が表示されます。  

![インターネット ブラウザ - Telegram - `getUpdates`](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-internet_browser-telegram-getupdates.png)
_インターネット ブラウザ - Telegram - `getUpdates`_

## ブラウザ経由で Telegram メッセージを送信 - **sendMessage** API
結論として、Jenkins プラグインを使用して Telegram メッセージを送信しますが、テスト目的で、`sendMessage` Telegram API を使用してメッセージをブラウザに送信します。  

API は次のとおりで、上記の手順で見つかったトークンとチャット ID を使用して Telegram メッセージを送信できます。  

```shell
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chatid>&text=im bot

# example
- token: 6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb
- chatid : 1230000000

https://api.telegram.org/bot6870000000:AAEz8Oaaaaaaaaaa-RBixhsHabbbbbbbbbb/sendMessage?chat_id=1230000000&text=im bot
```
うまくいきましたか？以下のようにTelegram上で`im bot`というメッセージを確認することができました。  

![テレグラム - `sendMessage` API](/assets/images/231227193010/unclesnote-create_a_telegram_bot_and_send_a_message-telegram-sendmessage_api.png)
_テレグラム - `sendMessage` API_

