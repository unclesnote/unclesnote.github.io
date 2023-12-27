---
title:  从 Jenkins 管道脚本发送 Telegram 消息
image:
  path: /assets/images/231227143211/zh-thumb-unclesnote-sending_telegram_message_from_jenkins_pipeline_script.png
  alt: 从 Jenkins 管道脚本发送 Telegram 消息
images: ["/assets/images/231227143211/unclesnote-sending_telegram_message_from_jenkins_pipeline_script-jenkins-telegram_plugins.png"]
categories: [乌班图, 詹金斯, 管道]
tags: [詹金斯, 电报, curl, 乌班图, 詹金斯, 管道]
description:  当然，Jenkins 有 Telegram 插件，但我个人不想经历反复试验。自从插件发布以来已经至少两年了。我将在 Linux 中使用`curl`发送电报消息。
public: true
toc: false
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-27 14:32:11 +0900
ro_id: 231227143211
ro_name: sending_telegram_message_from_jenkins_pipeline_script
ro_ref: 231227143211/sending_telegram_message_from_jenkins_pipeline_script
lang: zh
---
当然，Jenkins 有 Telegram 插件，但我个人不想经历反复试验。自从插件发布以来已经至少两年了。我将在 Linux 中使用`curl`发送电报消息。  

![Jenkins - Telegram 插件](/assets/images/231227143211/unclesnote-sending_telegram_message_from_jenkins_pipeline_script-jenkins-telegram_plugins.png)
_Jenkins - Telegram 插件_

## 用于发送 Telegram 消息的 Groovy 函数
我创建了两个 Groovy 函数以在 Jenkins 脚本中使用。 `func_telegram_sendMessage_message` 是一个通过简单插入字符串来发送 Telegram 消息的函数。另一个 `func_telegram_sendMessage_file` 是一个将文本文件的内容作为 Telegram 消息发送的函数。  

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
虽然我在通过`curl`发送 Telegram 消息时尚未遇到错误，但我用`try-catch`语句包装了curl语句，以防止管道进程因错误而停止。我个人认为管道处理比发送 Telegram 消息具有更高的优先级。  
## 在**管道**的**步骤**内使用函数
下面是如何在`pipeline`的`steps`中调用上面创建的函数。我对 Telegram 机器人的`token`和`chatid`进行了硬编码。如果以后有需要，我会尝试使用Jenkins的`Credentials`功能来实现。  

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
