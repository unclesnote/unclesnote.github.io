---
title:  Sending Telegram message from Jenkins pipeline script
image:
  path: /assets/images/231227143211/en-thumb-unclesnote-sending_telegram_message_from_jenkins_pipeline_script.png
  alt: Sending Telegram message from Jenkins pipeline script
images: ["/assets/images/231227143211/unclesnote-sending_telegram_message_from_jenkins_pipeline_script-jenkins-telegram_plugins.png"]
categories: [Ubuntu, Jenkins, Pipeline]
tags: [jenkins, telegram, curl, Ubuntu, Jenkins, Pipeline]
description:  Of course, there are Telegram plugins for Jenkins, but I personally didn't want to go through trial and error. It has been at least two years since the plugins
public: true
toc: false
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-27 14:32:11 +0900
ro_id: 231227143211
ro_name: sending_telegram_message_from_jenkins_pipeline_script
ro_ref: 231227143211/sending_telegram_message_from_jenkins_pipeline_script
lang: en
---
Of course, there are Telegram plugins for Jenkins, but I personally didn't want to go through trial and error. It has been at least two years since the plugins were released. I will send a telegram message using `curl` in linux.  

![Jenkins - Telegram Plugins](/assets/images/231227143211/unclesnote-sending_telegram_message_from_jenkins_pipeline_script-jenkins-telegram_plugins.png)
_Jenkins - Telegram Plugins_

## Groovy functions for sending Telegram messages
I created two Groovy functions to use in the Jenkins script. `func_telegram_sendMessage_message` is a function that sends a Telegram message by simply inserting a string. Another `func_telegram_sendMessage_file` is a function that sends the contents of a text file as a Telegram message.  

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
Although I have not yet encountered an error while sending a Telegram message through `curl`, I wrapped the curl statement with a `try-catch` statement to prevent the pipeline process from stopping due to an error. I personally think that pipeline processing has a higher priority than sending a Telegram message.  
## Use functions within **steps** of a **pipeline**
Below is how to call the function created above in the `steps` in the `pipeline`. I hardcoded the `token` and `chatid` of the Telegram bot. If the need arises later, I will try to implement it using Jenkins' `Credentials` function.  

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
