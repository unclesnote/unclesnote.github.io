---
title:  Windows 10의 여러 디스플레이 구성에서 디스플레이 비활성 문제
image:
  path: /assets/images/231214163036/ko-thumb-unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10.png
  alt: Windows 10의 여러 디스플레이 구성에서 디스플레이 비활성 문제
images: ["/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-windows_+_r_enter_regedit.png", "/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-registry_editor-remove_the_configuration_and_connectivity_folders_in_the_graphicsdrivers_folder.png"]
categories: [컴퓨터, 문제 해결]
tags: [컴퓨터, 문제해결]
description:  저는 노트북을 들고 다니면서 가끔 재택근무를 하는 사용자입니다. 직장과 집에서 노트북에 연결된 디스플레이를 2개 이상 사용하는데 가끔 일부 디스플레이만 노트북에서 인식되어 디스플레이 설정에 들어가면 비활성 상태로 표시되는 경우가 있습니다. 제 생각엔 Windows에서는 각 환경에 맞는
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-12-14 16:30:36 +0900
ro_id: 231214163036
ro_name: display_inactivity_issues_in_multiple_display_configurations_in_windows_10
ro_ref: 231214163036/display_inactivity_issues_in_multiple_display_configurations_in_windows_10
lang: ko
---
저는 노트북을 들고 다니면서 가끔 재택근무를 하는 사용자입니다. 직장과 집에서 노트북에 연결된 디스플레이를 2개 이상 사용하는데 가끔 일부 디스플레이만 노트북에서 인식되어 디스플레이 설정에 들어가면 비활성 상태로 표시되는 경우가 있습니다.  

제 생각엔 Windows에서는 각 환경에 맞는 디스플레이 구성을 프리셋 형태로 레지스트리에 저장해 관리하는 것 같은데, 가끔 이런 구성이 왜곡되어 이런 문제가 발생하는 것 같습니다.  

이 문제를 해결하기 위해 제가 찾은 방법은 Windows 디스플레이 구성 레지스트리 값을 삭제하고 초기화하는 것입니다. 결론적으로 멀티 디스플레이 환경을 다시 설정해야 합니다. 방법을 설명하겠습니다.  
## 1. Windows 레지스트리 편집기를 엽니다.
`Windows + R`을 사용하여 실행 대화 상자를 통해 `regedit`를 입력하거나 시작 메뉴에서 `regedit.exe`를 검색하여 `Registry Editor`를 실행합니다.  
![Windows + R > `regedit` 입력](/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-windows_+_r_enter_regedit.png)
_Windows + R > `regedit` 입력_

## 2. 레지스트리 편집기에서 표시 사전 설정 값 삭제
레지스트리 편집기에서 주소 표시줄에 아래 경로를 입력하거나 트리에서 경로로 이동하세요.  

```
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers
```
마우스 오른쪽 버튼 클릭 메뉴에서 `GraphicsDrivers` 폴더에 있는 다음 두 폴더를 제거합니다.  
- Configuration
- Connectivity

![레지스트리 편집기 - `GraphicsDrivers` 폴더에서 `Configuration` 및 `Connectivity` 폴더를 제거합니다.](/assets/images/231214163036/unclesnote-display_inactivity_issues_in_multiple_display_configurations_in_windows_10-registry_editor-remove_the_configuration_and_connectivity_folders_in_the_graphicsdrivers_folder.png)
_레지스트리 편집기 - `GraphicsDrivers` 폴더에서 `Configuration` 및 `Connectivity` 폴더를 제거합니다._

## 3. 윈도우 재부팅
Windows를 다시 시작합니다. 재부팅이 완료되면 Windows의 관점에서 내 디스플레이가 새로 인식되는 디스플레이가 됩니다.  

따라서 디스플레이 설정에서 디스플레이의 위치와 방향을 재설정해야 합니다. 간단히 말해서, 이것은 매우 성가신 일입니다. 진심으로 위로의 말씀을 드립니다.  
