---
title:  레노버 Ideapad Slim3 15ABA7 R5 윈도우 설치, 메모리 업그레이드
image:
  path: /assets/images/231214181812/ko-thumb-unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade.png
  alt: 레노버 Ideapad Slim3 15ABA7 R5 윈도우 설치, 메모리 업그레이드
images: ["/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-ventoy-www.ventoy.net-a_new_bootable_usb_solution.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-bios_security_secure_boot_disabled.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-윈도우11_설치-네트워크_연결_설정_진행불가.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면-나사_제거.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면판_열기.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_커버의_스티커_분리.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_장착.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-신규_메모리_동작_확인을_위해_하단_공간_확보.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-cpu-z-메모리.png", "/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-hwinfo64-시스템_요약-메모리.png"]
categories: [IT, PC]
tags: [IT, PC, Lenovo, Laptop]
description:  레노버 Slim3 15ABA7 R5은 프리 DOS가 기본 OS로 설치되어 있어 별도로 윈도우를 설치해야 한다. 윈도우 설치를 위한 기본과 메모리를 업그레이드 하는 방법을 알아 보겠다.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-14 18:18:12 +0900
ro_id: 231214181812
ro_name: lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade
ro_ref: 231214181812/lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade
lang: ko
---
**레노버 Slim3 15ABA7 R5**은 프리 DOS가 기본 OS로 설치되어 있어 별도로 윈도우를 설치해야 한다.  

윈도우 설치를 위한 기본과 메모리를 업그레이드 하는 방법을 알아 보겠다.  
## 스팩
![레노버 Slim3 15ABA7 R5](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5.png)
_레노버 Slim3 15ABA7 R5_

**레노버 Slim3 15ABA7 R5**은 CPU로 라이젠5 4세대(세잔)인 5625U 모델이 탑재되어 있다. 문론, 가성비 노트북인 만큼 CPU에 포함된 GPU를 공유해 사용하는 내장 그래픽이다.  

가격이 상대적으로 저렴하지만 쓸만한 성능의 가성비 노트북이긴 하지만, 장점이라면 메모리와 하드디스크의 확장성에 있다.  
- **저장장치** : NVMe M.2 SSD 256GB 기본 탑재 + 2.5인치 SATA 하드디스크 1개 추가 슬롯
- **메모리** : 8GB 온보드(DDR4-3200) + 추가 1개 소켓

SATA 하드디스크 1개와  DDR4 메모리 1개를 추가 업그레이드 가능하다.  
## 윈도우 USB 스틱 준비
![Ventoy - www.ventoy.net - A New Bootable USB Solution](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-ventoy-www.ventoy.net-a_new_bootable_usb_solution.png)
_Ventoy - www.ventoy.net - A New Bootable USB Solution_

일반적으로 윈도우를 설치하려면, USB 스틱에 부팅이 가능한 윈도우 이미지 버닝해 설치하는 것이 일반적이다.  하지만 우리는  [Ventoy](https://www.ventoy.net/en/download.html){:target="_blank"}라는 프로그램을 사용할 것이다.  

Ventoy 소프트웨어를 USB 스틱에 버닝하면 이동식 디스크로 윈도우가 인식한다. 그리고, 다운로드 받은 윈도우 ISO 파일을 복사해 컴퓨터를 시동하면, USB 스틱에 저장된 ISO 파일을 선택해 부팅이 가능하다. 이것은 하나의 USB 스틱에 여러가지 ISO 파일을 복사해 선택적으로 부팅 및 설치 할 수 있는 장점이 있다.  
- **USB 스틱에 Ventoy를 설치하는 방법** : https://www.ventoy.net/en/doc_start.html

레노버 드라이버 사이트에서 윈도우10과 윈도우 11의 시스템 드라이버를 지원 하지만, 나는 윈도우11을 설치했다.  

Ventoy 기반에 윈도우 ISO파일이 복사된 USB 스틱을 준비한다.  

그리고,  레노버 드라이버 사이트에서 [무선랜 드라이버](https://pcsupport.lenovo.com/kr/en/products/laptops-and-netbooks/3-series/ideapad-3-15aba7/downloads/driver-list){:target="_blank"}를 다운로드 받아 USB 스틱에 저장한다.  

윈도우11 설치의 경우, 윈도우 ISO 이미지에 무선랜 드라이버가 포함되어 있지 않기 때문에 추후 인터넷을 통한 윈도우 초기설정이 진행 불가능하다. 그래서, 미리 무선랜 드라이버를 준비 해야한다.  
## BIOS 설정 및 윈도우 설치
Lenovo Slim3 15ABA7 R5의 디스플레이를 연다. 자동으로 노트북에 전원이 들어오게 되는데, `F2`를 지속적으로 여러번 눌러 BIOS 설정화면에 진입한다.  

Ventoy로 부팅을 하면 Securiy Verification 관련한 에러가 발생하는데, 이를 방지하기 위해 `Security` 메뉴에서 `Secure Boot`을 `Disable`로 변경한다. USB스틱을 랩탑에 장착하고 BIOS 설정을 저장하고 종료한다.  
![BIOS > Security > Secure Boot > Disabled](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-bios_security_secure_boot_disabled.png)
_BIOS > Security > Secure Boot > Disabled_

> **랩탑 디스플레이 열림에 의한 자동 전원켜짐 비활성화**  
> 아마도 레노버는 랩탑 디스플레이을 열었을 때, 자동으로 전원이 켜지는 것이 사용자 편의에 좋다고 생각 한 듯 싶다.  
> 이 기능이 싫다면, BIOS에서 `Configuration` 메뉴의 `Flip to Boot` 기능을 `Disabled` 로 변경 할 수 있다.  
{: .prompt-info}
Ventory 부팅 메뉴에서 윈도우 ISO를 선택해 윈도우를 설치한다.  

**레노버 Slim3 15ABA7 R5**는 윈도우11을 설치하면, 자동으로 무선랜 드라이버가 설치되지 않는다. 따라서 `네트워크 연결` 설정 단계에서 더 이상 진행이 불가능 하다.  
![윈도우11 설치 - `네트워크 연결` 설정 진행불가](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-윈도우11_설치-네트워크_연결_설정_진행불가.png)
_윈도우11 설치 - `네트워크 연결` 설정 진행불가_

해당 화면에서 `Shift + F10`을 눌러 명령 프롬프트 윈도우를 연다. 그리고 `OOBE\BYPASSNRO`를 입력한다.  

이후 자동으로 재부팅이 되는데, 이후 `네트워크 연결` 설정을 건너뛰기 할 수 있다.  

```
OOBE\BYPASSNRO
```
윈도우 설치가 완료되면, USB 스틱 저장했던 무선랜 드라이버를 설치한다. 그리고 [레노버 드라이버 사이트](https://pcsupport.lenovo.com/kr/ko/products/laptops-and-netbooks/3-series/ideapad-3-15aba7/downloads){:target="_blank"}에 접속해 설치 못한 나머지 드라이버 들을 설치한다.  
## 메모리 구매
아래와 같이 **레노버 Slim3 15ABA7 R5**는 DDR4-3200 8GB의 메모리가 온보드 형식으로 장착되어 있다. 따라서 메모리 듀얼채널 구성을 만들기 위해 8GB 용량의 DDR4-3200 클럭 메모리를 구매한다.  
- **메모리** : 8GB 온보드(DDR4-3200) + 추가 1개 소켓

쇼핑몰에 DDR4-3200 혹은 PC4-25600으로 클럭이 표시 된, 메모리가 있다면 구매하면 된다.  
## 메모리 업그레이드 설치
부드러운 천에 랩탑을 뒤집어 올려놓고, 후면에 모든 나사를 풀어준다.  
![레노버 Slim3 15ABA7 R5 - 후면 - 나사 제거](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면-나사_제거.png)
_레노버 Slim3 15ABA7 R5 - 후면 - 나사 제거_

그리고 사용하지 않는 플라스틱 카드를 우측 상단의 틈에 넣어 후면판을 벌려준다. 그리고 통조림 캔을 오픈 하듯이 조금씩 돌려가면서 후면판을 열어준다. 너무 깊이 플라스틱 카드를 넣으면 랩탑 기판이 손상 될 수 있으니 조금만 넣도록 한다.  
![레노버 Slim3 15ABA7 R5 - 후면판 열기](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-후면판_열기.png)
_레노버 Slim3 15ABA7 R5 - 후면판 열기_

위에서 설명 했듯이, SATA 하드디스크 1개와  DDR4 메모리 1개를 추가 업그레이드 가능하다.  
![레노버 Slim3 15ABA7 R5 - 내부](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부.png)
_레노버 Slim3 15ABA7 R5 - 내부_

다른 랩탑과 다르게, **레노버 Slim3 15ABA7 R5**는 메모리 슬롯 커버가 존재한다. 커버에 붙여있는 스티커를 조금 분리해 내고 커버를 위로 들어 제거한다.  
![레노버 Slim3 15ABA7 R5 - 내부 - 메모리 커버의 스티커 분리](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_커버의_스티커_분리.png)
_레노버 Slim3 15ABA7 R5 - 내부 - 메모리 커버의 스티커 분리_

메모리를 장착 했다면, 다시 메모리 커버를 장착하고 스티커를 붙여준다.  
![레노버 Slim3 15ABA7 R5 - 내부 - 메모리 장착](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-내부-메모리_장착.png)
_레노버 Slim3 15ABA7 R5 - 내부 - 메모리 장착_

그리고 후면판을 닫기 전에, 랩탑이 정상적으로 켜지고 부팅이 가능한지 확인한다. 메모리 접촉 불량으로 부팅이 되지 않는다면, 후면판을 다시 열어야 하기 때문에 후면판을 닫지 않은 상태에서 정상부팅 여부를 확인한다.  

랩탑 힌지 부분에 담배 케이스 같은 것을 고여서 팬이 돌아가는데 무리가 없도록 하고, 랩탑 전원을 켠다. 메모리가 정상적으로 인식이 되지 않거나 부팅이 되지 않는다면, 메모리를 추출 했다가 다시 장착해 본다.  
![레노버 Slim3 15ABA7 R5 - 신규 메모리 동작 확인을 위해 하단 공간 확보](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-신규_메모리_동작_확인을_위해_하단_공간_확보.png)
_레노버 Slim3 15ABA7 R5 - 신규 메모리 동작 확인을 위해 하단 공간 확보_

랩탑이 정상 동작 한다면, 후면판을 닫고 풀었던 나사들을 다시 조여준다.  
## 메모리 듀얼채널 인식 확인
[CPU-Z](https://www.cpuid.com/softwares/cpu-z.html){:target="_blank"} 혹은 [HWiNFO64](https://www.hwinfo.com/download/){:target="_blank"}를 설치 하거나 포터블 버전을 다운로드 한다.  

CPU-Z에서 메모리가 [듀얼채널](https://en.wikipedia.org/wiki/Multi-channel_memory_architecture){:target="_blank"}로 작동 할 경우  일반적으로 Channel에 `Dual`이라고 표시 되지만, **레노버 Slim3 15ABA7 R5**는 `2 x 64-bit` 표시 되었다.  

이것이 에러인지 CPU-Z 최신 버전의 차이점 인지 확실하지 않다.  
![레노버 Slim3 15ABA7 R5 - CPU-Z - 메모리](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-cpu-z-메모리.png)
_레노버 Slim3 15ABA7 R5 - CPU-Z - 메모리_

하지만, HWiNFO64에서는 `Dual-Channel`로 올바르게 표시 되었다.  
![레노버 Slim3 15ABA7 R5 - HWiNFO64 - 시스템 요약 - 메모리](/assets/images/231214181812/unclesnote-lenovo_ideapad_slim3_15aba7_r5_windows_installation_memory_upgrade-레노버_slim3_15aba7_r5-hwinfo64-시스템_요약-메모리.png)
_레노버 Slim3 15ABA7 R5 - HWiNFO64 - 시스템 요약 - 메모리_

