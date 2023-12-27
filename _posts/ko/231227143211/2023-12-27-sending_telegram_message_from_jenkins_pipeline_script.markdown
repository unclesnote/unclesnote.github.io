---
title:  Jenkins 파이프라인 스크립트에서 텔레그램 메시지 보내기
image:
  path: /assets/images/231227143211/ko-thumb-unclesnote-sending_telegram_message_from_jenkins_pipeline_script.png
  alt: Jenkins 파이프라인 스크립트에서 텔레그램 메시지 보내기
images: ["/assets/images/231227143211/unclesnote-sending_telegram_message_from_jenkins_pipeline_script-jenkins-telegram_plugins.png"]
categories: [우분투, 젠킨스, Pipeline]
tags: [젠킨스, 전보, curl, 우분투, 젠킨스, Pipeline]
description:  물론 Jenkins용 Telegram 플러그인도 있지만 개인적으로는 시행착오를 겪고 싶지 않았습니다. 플러그인이 출시된 지 최소 2년이 지났습니다. 리눅스에서 `curl`을 사용하여 텔레그램 메시지를 보내보겠습니다.
public: true
toc: false
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-27 14:32:11 +0900
ro_id: 231227143211
ro_name: sending_telegram_message_from_jenkins_pipeline_script
ro_ref: 231227143211/sending_telegram_message_from_jenkins_pipeline_script
lang: ko
---
물론 Jenkins용 Telegram 플러그인도 있지만 개인적으로는 시행착오를 겪고 싶지 않았습니다. 플러그인이 출시된 지 최소 2년이 지났습니다. 리눅스에서 `curl`을 사용하여 텔레그램 메시지를 보내보겠습니다.  

![Jenkins - 텔레그램 플러그인](/assets/images/231227143211/unclesnote-sending_telegram_message_from_jenkins_pipeline_script-jenkins-telegram_plugins.png)
_Jenkins - 텔레그램 플러그인_

## 텔레그램 메시지 전송을 위한 Groovy 함수
Jenkins 스크립트에서 사용할 두 개의 Groovy 함수를 만들었습니다. `func_telegram_sendMessage_message`는 간단히 문자열을 삽입하여 텔레그램 메시지를 보내는 함수입니다. 또 다른 `func_telegram_sendMessage_file`은 텍스트 파일의 내용을 텔레그램 메시지로 보내는 함수입니다.  

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
아직 `curl`을 통해 텔레그램 메시지를 보내는 동안 오류가 발생하지 않았지만 오류로 인해 파이프라인 프로세스가 중단되는 것을 방지하기 위해 `try-catch` 문으로 컬 문을 래핑했습니다. 저는 개인적으로 텔레그램 메시지를 보내는 것보다 파이프라인 처리가 더 우선순위가 높다고 생각합니다.  
## **파이프라인**의 **단계** 내에서 함수 사용
아래는 `파이프라인`의 `단계`에서 위에서 생성한 함수를 호출하는 방법입니다. 텔레그램 봇의 `token`과 `chatid`를 하드코딩했습니다. 나중에 필요하게 되면 Jenkins의 `Credentials` 기능을 이용해 구현해보도록 하겠습니다.  

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
