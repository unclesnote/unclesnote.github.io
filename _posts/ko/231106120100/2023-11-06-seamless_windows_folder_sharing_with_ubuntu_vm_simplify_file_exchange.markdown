---
title:  VirtualBox에서 Ubuntu 공유 폴더 설정 - Windows 파일 공유
image:
  path: /assets/images/231106120100/ko-thumb-unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange.png
  alt: VirtualBox에서 Ubuntu 공유 폴더 설정 - Windows 파일 공유
images: ["/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-oracle_vm_virtualbox-add_shared_folder.png", "/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-create_a_test.txt_file_using_the_touch_command_in_ubuntu_vm_and_check_it_in_windows.png"]
categories: [우분투, Virtual Box]
tags: [VirtualBox, vboxsf, 우분투, 폴더공유]
description:  제 경우에는 Oracle VM VirtualBox에서 Ubuntu VM과 Windows 간에 파일 공유가 자주 발생합니다. 물론 게스트 추가 기능을 이용하면 마우스 드래그만으로 파일을 공유할 수 있지만, 여전히 불편할 때가 있습니다. 그래서 Ubuntu VM과 Windows 폴더를
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-06 12:01:00 +0900
ro_id: 231106120100
ro_name: seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange
ro_ref: 231106120100/seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange
lang: ko
---
제 경우에는 Oracle VM VirtualBox에서 Ubuntu VM과 Windows 간에 파일 공유가 자주 발생합니다. 물론 게스트 추가 기능을 이용하면 마우스 드래그만으로 파일을 공유할 수 있지만, 여전히 불편할 때가 있습니다.  

그래서 Ubuntu VM과 Windows 폴더를 공유하는 방법을 설명하고자 합니다.  
## Virtual Box에 공유 폴더 추가하기
Ubuntu VM의 설정으로 이동합니다. 그런 다음 `공유 폴더` 탭에 공유할 폴더를 추가하세요.  

공유 폴더 설정 창의 `폴더 경로`에 Ubuntu VM과 공유하려는 폴더를 설정합니다. 나머지 폴더 및 설정 항목은 다음과 같습니다.  
- **폴더 경로** : Ubuntu VM과 공유할 `Windows` 폴더 경로
- **폴더 이름** : 공유 폴더 닉네임입니다. 가능하다면 `Mount point` 폴더명과 동일하게 만드세요.
- **마운트 지점** : `Ubuntu VM`에 공유 폴더를 마운트하는 경로
- ✓ **자동 마운트** : 부팅 시 공유 폴더를 자동으로 마운트합니다.
- ✓ **영구화** : Ubuntu VM이 실행되는 동안 현재 설정을 입력하면 이 항목이 나타납니다. 영구적인 설정을 원하시면 체크하세요.

![Oracle VM VirtualBox - 공유 폴더 추가](/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-oracle_vm_virtualbox-add_shared_folder.png)  

Oracle VM VirtualBox - 공유 폴더 추가
{: style="color:gray; font-size: 80%; text-align: center;"}

제 경우에는 Ubuntu VM의 공유 폴더로 `/home/pooh/_shared`를 설정했습니다. 참고로 제 우분투 계정 이름은 `pooh`입니다.  
## Ubuntu VM의 폴더 권한
Ubuntu VM이 실행되는 동안 공유 폴더를 추가한 경우 먼저 Ubuntu VM을 재부팅하세요.  

그리고, `/home/pooh/_shared`를 입력하려고 하면 권한이 없다는 오류 메시지가 출력됩니다. 이는 `vboxsf` 그룹에 포함된 사용자만 공유 폴더에 접근할 수 있기 때문입니다.  

```shell
$ ls -l /home/pooh
total 100
...
drwxrwx---  1 root vboxsf     0 11월  6 10:03 _shared
...

$ cd /home/pooh
bash: cd: /home/pooh: Permission denied

```
`gpasswd` 명령을 사용하여 Ubuntu 계정을 `vboxsf` 그룹에 추가하세요. 참고로 제 우분투 계정 이름은 `pooh`입니다. 따라서 `pooh`를 Ubuntu 계정 이름으로 바꿔서 명령을 실행하세요.  

```shell
sudo gpasswd -a pooh vboxsf
```
가장 중요한. 마지막으로 Ubuntu VM을 재부팅합니다.  
## 테스트
Ubuntu VM 재부팅이 완료되면 테스트를 수행해 보겠습니다.  

Ubuntu VM의 공유 폴더에 `touch` 명령을 사용하여 `test.txt` 파일을 생성해 보겠습니다. Windows 공유 폴더에 생성된 `test.txt` 파일이 보이시나요?  
![Ubuntu VM에서 `touch` 명령을 사용하여 `test.txt` 파일을 생성하고 Windows에서 확인합니다.](/assets/images/231106120100/unclesnote-seamless_windows_folder_sharing_with_ubuntu_vm_simplify_file_exchange-create_a_test.txt_file_using_the_touch_command_in_ubuntu_vm_and_check_it_in_windows.png)  

Ubuntu VM에서 `touch` 명령을 사용하여 `test.txt` 파일을 생성하고 Windows에서 확인합니다.
{: style="color:gray; font-size: 80%; text-align: center;"}

