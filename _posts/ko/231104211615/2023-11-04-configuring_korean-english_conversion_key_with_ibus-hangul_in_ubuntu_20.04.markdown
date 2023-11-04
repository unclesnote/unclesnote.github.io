---
title:  Ubuntu 20.04에서 ibus-hangul을 사용하여 한-영 변환 키 구성
image:
  path: /assets/images/231104211615/ko-thumb-unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04.png
  alt: Ubuntu 20.04에서 ibus-hangul을 사용하여 한-영 변환 키 구성
images: ["/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-search_region_and_run_region_lanugages.png", "/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-add_korean_hangul_input_source.png", "/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-korean-english_conversion_key_setting.png"]
categories: [우분투, 일반]
tags: [ibushangul, 우분투, 일반, 키보드]
description:  소프트웨어 개발 목적으로 Ubuntu를 사용하는 경우 대부분 영어로 입력하게 됩니다. 그러나 어떤 경우에는 그놈 GUI에 한국어를 입력해야 할 수도 있습니다. 그래서 기본 설정에서는 영어 입력만 허용하므로 `ibus-hangul` 플러그인을 사용하여 한국어 입력을 설정하겠습니다.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-04 21:16:15 +0900
ro_id: 231104211615
ro_name: configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04
ro_ref: 231104211615/configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04
lang: ko
---
소프트웨어 개발 목적으로 Ubuntu를 사용하는 경우 대부분 영어로 입력하게 됩니다. 그러나 어떤 경우에는 그놈 GUI에 한국어를 입력해야 할 수도 있습니다.  

그래서 기본 설정에서는 영어 입력만 허용하므로 `ibus-hangul` 플러그인을 사용하여 한국어 입력을 설정하겠습니다.  
## ibus-hangul
`ibus-hangul`은 Linux나 Ubuntu에서 한글 입력 방식을 지원하는 플러그인입니다. `ibus`는 `입력 버스`를 의미합니다. Ubuntu는 이미 한글 입력을 지원하지만 최적화된 한글 입력을 위해 `ibus-hangul`을 업그레이드하여 사용할 예정입니다.  

apt 저장소를 업데이트하고 `ibus-hangul` 플러그인을 업그레이드하세요. 제가 설치했을 때 플러그인 크기는 615MB였습니다. 업그레이드하는데 시간이 좀 걸립니다.  

```shell
sudo apt update
sudo apt upgrade ibus-hangul
```
## 한국어 입력 설정
먼저, 애플리케이션에서 `지역` 키워드를 검색한 후 `지역 및 언어` 설정을 찾아서 실행하세요.  
![`지역`을 검색하고 `지역 및 언어`를 실행하세요.](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-search_region_and_run_region_lanugages.png)  

`지역`을 검색하고 `지역 및 언어`를 실행하세요.
{: style="color:gray; font-size: 80%; text-align: center;"}

그런 다음 `지역 및 언어` 탭에 `입력 소스`를 추가하세요. `한국어`를 검색하고 `한국어(한글)`를 추가하세요.  
![`한국어(한글)` 입력 소스 추가](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-add_korean_hangul_input_source.png)  

`한국어(한글)` 입력 소스 추가
{: style="color:gray; font-size: 80%; text-align: center;"}

새로 추가된 입력소스를 설정하기 전, 기존 `English(US)`를 제거하세요. 새로 추가된 `한국어(한글)` 입력소스와의 충돌을 방지하기 위함이다. 그리고 추가된 입력 소스에는 이미 영어 입력 기능이 포함되어 있습니다.  

`한국(한글)` 입력 소스에서 톱니바퀴 아이콘을 클릭하여 `IBusHangle Setup`을 엽니다.  
![한영변환키 설정](/assets/images/231104211615/unclesnote-configuring_korean-english_conversion_key_with_ibus-hangul_in_ubuntu_20.04-korean-english_conversion_key_setting.png)  

한영변환키 설정
{: style="color:gray; font-size: 80%; text-align: center;"}

그런 다음 `Etc` 섹션에서 `한글 모드로 시작`을 활성화하세요. 참고로 Ubuntu를 부팅할 때 GNOME GUI의 첫 번째 입력 모드를 한국어로 설정하려면 활성화하세요.  

그리고 기본으로 추가된 `한글 토글키`를 모두 제거합니다. 이 키가 사용 중인 실제 키보드의 언어 전환 키와 일치한다는 보장은 없습니다.  

`추가` 버튼을 클릭하고 새 창이 열리면 키보드의 언어 전환 키를 누르세요. 제 키보드의 경우 `Alt_R`이 언어 변경 키로 지정되어 있었습니다.  
