---
title:  Jenkins パイプライン スクリプトから Telegram メッセージを送信する
image:
  path: /assets/images/231227143211/ja-thumb-unclesnote-sending_telegram_message_from_jenkins_pipeline_script.png
  alt: Jenkins パイプライン スクリプトから Telegram メッセージを送信する
images: ["/assets/images/231227143211/unclesnote-sending_telegram_message_from_jenkins_pipeline_script-jenkins-telegram_plugins.png"]
categories: [Ubuntu, ジェンキンス, パイプライン]
tags: [ジェンキンス, 電報, curl, Ubuntu, ジェンキンス, パイプライン]
description:  もちろん、Jenkins 用の Telegram プラグインもありますが、個人的には試行錯誤したくありませんでした。プラグインがリリースされてから少なくとも 2 年は経過しています。 Linuxの`curl`を使って電報メッセージを送信してみます。
public: true
toc: false
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-27 14:32:11 +0900
ro_id: 231227143211
ro_name: sending_telegram_message_from_jenkins_pipeline_script
ro_ref: 231227143211/sending_telegram_message_from_jenkins_pipeline_script
lang: ja
---
もちろん、Jenkins 用の Telegram プラグインもありますが、個人的には試行錯誤したくありませんでした。プラグインがリリースされてから少なくとも 2 年は経過しています。 Linuxの`curl`を使って電報メッセージを送信してみます。  

![Jenkins - 電報プラグイン](/assets/images/231227143211/unclesnote-sending_telegram_message_from_jenkins_pipeline_script-jenkins-telegram_plugins.png)
_Jenkins - 電報プラグイン_

## Telegram メッセージを送信するための Groovy 関数
Jenkins スクリプトで使用する 2 つの Groovy 関数を作成しました。 `func_telegram_sendMessage_message` は、文字列を挿入するだけで Telegram メッセージを送信する関数です。もう 1 つの `func_telegram_sendMessage_file` は、テキスト ファイルの内容を Telegram メッセージとして送信する関数です。  

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
`curl` を介して Telegram メッセージを送信するときにまだエラーが発生したことはありませんが、パイプライン プロセスがエラーによって停止するのを防ぐために、curl ステートメントを `try-catch` ステートメントでラップしました。私個人としては、Telegram メッセージの送信よりもパイプライン処理の方が優先度が高いと考えています。  
## **パイプライン**の**ステップ**内で関数を使用する
以下は、`パイプライン`の`ステップ`で上で作成した関数を呼び出す方法です。 Telegram ボットの`token`と`chatid`をハードコーディングしました。後で必要になったら、Jenkins の`Credentials`機能を使用して実装してみます。  

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
