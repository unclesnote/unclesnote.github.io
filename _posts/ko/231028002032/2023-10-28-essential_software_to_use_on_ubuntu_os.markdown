---
title:  Ubuntu OS에서 사용하는 필수 소프트웨어
image:
  path: /assets/images/231028002032/ko-thumb-basic_setting_-_general.png
  alt: Ubuntu OS에서 사용하는 필수 소프트웨어
images: ["/assets/images/231028002032/basic_setting_-_general.svg", "/assets/images/231028002032/basic_setting_-_general-krusader.png", "/assets/images/231028002032/basic_setting_-_general-gwenview.png", "/assets/images/231028002032/basic_setting_-_general-enable-log-resource-usage-mode.png", "/assets/images/231028002032/basic_setting_-_general-photopea.png", "/assets/images/231028002032/basic_setting_-_general-photopea-adblock.png", "/assets/images/231028002032/basic_setting_-_general-krita.png", "/assets/images/231028002032/basic_setting_-_general-krita-downdlaod-appimage.png", "/assets/images/231028002032/basic_setting_-_general-easystroke.png", "/assets/images/231028002032/basic_setting_-_general-easystroke-download.png"]
categories: [우분투, 도구]
tags: [크루세이더, 그웬뷰, 포토피아, 크리타, 이지스트로크, 이미지뷰어, 이미지편집기, 파일탐색기, 마우스매크로, 우분투, 도구]
description:  Ubuntu OS의 특별한 장점 때문에 Ubuntu를 사용하고 있다면 Windows 환경에서 사용했던 것과 유사한 소프트웨어를 Ubuntu 환경에서도 사용할 수 있는지 찾아보게 될 것입니다. 그래서 파일 브라우저, 이미지 뷰어/편집기, 생산성 도구 등 우분투를 사용할 때 일반적으로 사용하기 좋은 몇 가지 소프트웨어를 소개하겠습니다.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-28 00:20:32 +0900
ro_id: 231028002032
ro_name: essential_software_to_use_on_ubuntu_os
ro_ref: 231028002032/essential_software_to_use_on_ubuntu_os
lang: ko
---
Ubuntu OS의 특별한 장점 때문에 Ubuntu를 사용하고 있다면 Windows 환경에서 사용했던 것과 유사한 소프트웨어를 Ubuntu 환경에서도 사용할 수 있는지 찾아보게 될 것입니다. 그래서 파일 브라우저, 이미지 뷰어/편집기, 생산성 도구 등 우분투를 사용할 때 일반적으로 사용하기 좋은 몇 가지 소프트웨어를 소개하겠습니다.  
![우분투 소프트웨어](/assets/images/231028002032/basic_setting_-_general.svg)  

우분투 소프트웨어
{: style="color:gray; font-size: 80%; text-align: center;"}

## 파일 탐색기
### 크루세이더
Windows 환경에서 [Q-Dir](http://www.q-dir.com){:target="_blank"} 또는 [Total Commander](https://www.ghisler.com/download.htm){:target="_blank"}를 사용해 본 경험이 있으신 분은 [Krusader ](https://krusader.org){:target="_blank"}에서는 분할 창 및 멀티탭 파일 탐색 환경을 제공합니다.  
![크루세이더](/assets/images/231028002032/basic_setting_-_general-krusader.png)  

크루세이더
{: style="color:gray; font-size: 80%; text-align: center;"}

설치 방법은 매우 쉽습니다. apt를 사용하여 설치할 수 있습니다.  

```shell
sudo apt update
sudo apt install krusader
```
## 이미지 뷰어/편집기
### 그웬뷰
[GwenView](https://github.com/KDE/gwenview){:target="_blank"}는 제가 사용해 본 최고의 Ubuntu 이미지 뷰어입니다. 더 나은 이미지 뷰어를 찾으면 업데이트하겠습니다.  
![그웬뷰](/assets/images/231028002032/basic_setting_-_general-gwenview.png)  

그웬뷰
{: style="color:gray; font-size: 80%; text-align: center;"}

그러나 이미지 파일을 자주 업데이트하면 GwenView 목록의 썸네일 모양과 실제 이미지가 다를 수 있습니다. 따라서 썸네일 캐시 사용을 비활성화하는 것이 좋습니다.  
`설정 > Gwenview 구성 > 고급`에서 `낮은 리소스 사용 모드`를 선택하세요.  
![GwenView - 썸네일 캐시를 비활성화하려면 `낮은 리소스 사용 모드`를 확인하세요.](/assets/images/231028002032/basic_setting_-_general-enable-log-resource-usage-mode.png)  

GwenView - 썸네일 캐시를 비활성화하려면 `낮은 리소스 사용 모드`를 확인하세요.
{: style="color:gray; font-size: 80%; text-align: center;"}

GwenView는 apt를 사용하여 쉽게 설치할 수 있습니다.  

```shell
sudo apt install gwenview -y
```
### 포토피아
포토샵에 익숙한 분들이라면 가장 좋은 대안은 [포토피아](https://www.photopea.com){:target="_blank"}가 아닐까 싶습니다. Photopia는 Photoshop과 가장 유사한 인터페이스를 제공하는 웹 앱입니다.  
![포토피 - www.photopea.com](/assets/images/231028002032/basic_setting_-_general-photopea.png)  

포토피 - www.photopea.com
{: style="color:gray; font-size: 80%; text-align: center;"}

포토피아와 유사한 웹사이트도 있지만, 포토피아의 장점은 광고 차단기가 웹상의 광고를 차단할 수 있다는 점, 이것이 그들의 수익 모델이다. 크롬 브라우저 사용자라면 웹스토어에서 `AdBlock`을 검색하여 설치하세요.  
`AdBlock`을 사용하지 않더라도 오른쪽 패널에 광고가 다른 사이트에 비해 제한적으로 표시되기 때문에 크게 거슬리지는 않습니다.  
![Photopea - 오른쪽 패널의 제한된 광고 및 Chrome 웹 브라우저의 AdBlock 확장 프로그램](/assets/images/231028002032/basic_setting_-_general-photopea-adblock.png)  

Photopea - 오른쪽 패널의 제한된 광고 및 Chrome 웹 브라우저의 AdBlock 확장 프로그램
{: style="color:gray; font-size: 80%; text-align: center;"}

### 크리타
Photopia와는 다른 오프라인 이미지 편집기를 찾고 있다면 Krita가 대안이 될 수 있습니다. 하지만 포토샵에 매우 익숙한 사용자라면 낯설게 느껴질 수도 있습니다. GUI 인터페이스는 Photoshop과 유사하지만 단축키와 도구는 여러 면에서 다릅니다.  
![크리타](/assets/images/231028002032/basic_setting_-_general-krita.png)  

크리타
{: style="color:gray; font-size: 80%; text-align: center;"}

Photoshop과 완전히 유사하지는 않지만, 이미지를 편집하거나 그리고 싶고 완전한 소프트웨어를 찾고 있다면 Krita가 좋은 선택이 될 수 있습니다.  
Krita는 앱 이미지 형태로 소프트웨어를 배포합니다. 아래 Krita 사이트를 방문하여 Linux용 앱 이미지를 다운로드하세요.  
- [https://krita.org/en/download/krita-desktop](https://krita.org/en/download/krita-desktop)

![Krita - Linux AppImage 다운로드](/assets/images/231028002032/basic_setting_-_general-krita-downdlaod-appimage.png)  

Krita - Linux AppImage 다운로드
{: style="color:gray; font-size: 80%; text-align: center;"}

다운로드한 Krita 앱 이미지에 실행 권한을 부여하고 실행해 보세요.  

```shell
cd ~/Downloads
chmod 777 *.appimage
```
## 생산력
### EasyStroke Gesture(마우스 제스처 매크로)
Windows에서 [Strokeit](https://www.tcbmi.com/strokeit){:target="_blank"} 마우스 제스처 매크로 소프트웨어를 사용해 본 경험이 있다면 `EasyStroke Gesture`가 Ubuntu를 위한 최고의 대안입니다.  
`마우스 오른쪽 버튼`으로 제스처를 그리려면 아래와 같은 설정이 필요합니다. 사실 부팅 시 자동으로 실행되도록 하는 것은 필수 옵션입니다.  
Easystrok Preferences 탭에서 Behavior를 `Button 3`으로 설정하고 Appearance에서 자동으로 실행되도록 설정하세요.  
`액션` 탭에서 마우스 제스처 액션을 추가할 수 있습니다.  
![EasyStroke - 기본 설정](/assets/images/231028002032/basic_setting_-_general-easystroke.png)  

EasyStroke - 기본 설정
{: style="color:gray; font-size: 80%; text-align: center;"}

Ubuntu Software 앱에서 검색하여 쉽게 설치할 수 있습니다.  
![Easystrok - Ubuntu 소프트웨어에서 다운로드](/assets/images/231028002032/basic_setting_-_general-easystroke-download.png)  

Easystrok - Ubuntu 소프트웨어에서 다운로드
{: style="color:gray; font-size: 80%; text-align: center;"}

다음은 마우스 제스처에 매핑하여 사용하고 있는 몇 가지 단축키입니다.  

|앱|단축키|설명|
| ------- | ---------------- | ----------------- |
|흔한|Ctrl + 홈|페이지 상단으로 이동|
|흔한|Ctrl + 끝|페이지 하단으로 이동|
|VS 코드|Ctrl + Alt + -|돌아가기|
|VS 코드|Ctrl + Shift + -|앞으로 나아가다|

