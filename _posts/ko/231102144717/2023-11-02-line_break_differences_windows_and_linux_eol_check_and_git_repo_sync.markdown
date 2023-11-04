---
title:  줄 바꿈 차이점 - Windows 및 Linux EOL 확인 및 Git Repo 동기화
image:
  path: /assets/images/231102144717/ko-thumb-unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync.png
  alt: 줄 바꿈 차이점 - Windows 및 Linux EOL 확인 및 Git Repo 동기화
images: ["/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-same_file_contents_but_different_files,_on_the_left_is_windows_pc_format_and_on_the_right_is_linux_unix_format.png", "/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-notepad++-eol_conversion-edit_eol_conversion_windows_cr_lf_or_unix_lf.png", "/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-accessing_git_bash_on_windows.png"]
categories: [Git]
tags: [Git, CRLF, LF, EOL변환, 줄바꿈, 노트패드플러스플러스, unix2dos, dos2unix]
description:  Linux와 Windows 모두에서 하나의 Git 저장소에 있는 파일을 수정하고 커밋해야 하는 경우, 콘텐츠가 명확하게 수정되지 않았음에도 Git 클라이언트가 Git 커밋 단계에서 해당 파일을 수정된 파일로 인식하는 경우가 있습니다. 문제의 원인은 파일 내용은 동일하더라도
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 14:47:17 +0900
ro_id: 231102144717
ro_name: line_break_differences_windows_and_linux_eol_check_and_git_repo_sync
ro_ref: 231102144717/line_break_differences_windows_and_linux_eol_check_and_git_repo_sync
lang: ko
---
Linux와 Windows 모두에서 하나의 Git 저장소에 있는 파일을 수정하고 커밋해야 하는 경우, 콘텐츠가 명확하게 수정되지 않았음에도 Git 클라이언트가 Git 커밋 단계에서 해당 파일을 수정된 파일로 인식하는 경우가 있습니다.  

문제의 원인은 파일 내용은 동일하더라도 Windows와 Linux에서 줄바꿈을 표현하는 기본 방식이 다르기 때문입니다. 아래 사진에서 왼쪽은 윈도우(PC)에서 수정하여 저장한 파일이고, 오른쪽은 리눅스(UNIX)에서 수정하여 저장한 파일이다.  
![파일 내용은 같지만 파일이 다릅니다. 왼쪽이 Windows PC 형식, 오른쪽이 Linux UNIX 형식입니다.](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-same_file_contents_but_different_files,_on_the_left_is_windows_pc_format_and_on_the_right_is_linux_unix_format.png)  

파일 내용은 같지만 파일이 다릅니다. 왼쪽이 Windows PC 형식, 오른쪽이 Linux UNIX 형식입니다.
{: style="color:gray; font-size: 80%; text-align: center;"}

## Windows와 Linux의 줄바꿈 ​​차이점
ASCII 문자 관점에서 볼 때,  

윈도우에서는 아래와 같이 `CRLF(Carriage Return with Line Feed)` 형태로 줄바꿈을 표현한다.  

```text
\r\n
```
우분투 등의 리눅스 시스템에서는 아래와 같이 줄바꿈을 `LF(Line Feed)`로만 표현합니다.  

```text
\n
```
Git에서 LF 형식의 줄바꿈을 표현한 파일을 받고, Windows 편집기에서 간단히 수정한 후 복원했다고 가정해 보겠습니다. 즉 파일의 내용은 표면적으로는 동일하지만 줄 바꿈을 CRLF로 수정하므로 Git의 파일과 다른 파일로 변환될 가능성이 있습니다.  

Linux에서 Windows로 작성된 bash 스크립트를 실행하면 디버깅 중에 알 수 없는 스크립트 실행 오류가 발생할 수 있습니다. 이는 Windows에서 CRLF 형식으로 줄바꿈을 저장한 쉘 스크립트와 bash가 이를 해석할 수 없기 때문일 수 있습니다.  
## 파일의 EOL(End Of Line) 확인 및 변환
물론, Windows에서 파일을 작성하더라도 PC(CRLF) 형식이 아닌 UNIX(LF) 형식으로 파일을 생성하고 변환할 수 있습니다. 그 반대도 가능합니다. 변환 작업을 일반적으로 `EOL(End Of Lines) 변환`이라고 합니다.  

사실, 각 OS별 EOL의 차이점을 처음 접할 때 약간 혼란스러울 수 있습니다. 따라서 앞으로 설명할 내용과 관련된 키워드를 아래와 같이 표로 매핑할 수 있다.  

|이름|윈도우|우분투(리눅스)|
| ------------------------------------------ | -------------------------------------- | -------------- |
|줄 바꿈 형식 용어|CRLF(라인 피드를 사용한 캐리지 리턴)|LF(줄 바꿈)|
|줄 바꿈 표현 문자|`\r\n`|`\n`|
|Ubuntu의 `file` 도구에서 제공되는 정보|CRLF 줄 종결자가 있는 ASCII 텍스트|ASCII 텍스트|
|Beyond Compare 도구의 EOL 유형|PC|유닉스|
|Ubuntu의 EOL 유형|해야 할 일|유닉스|
|Ubuntu의 EOL 변환 도구|unix2dos|dos2unix|

### 윈도우
[Notepad++](https://notepad-plus-plus.org/downloads){:target="_blank"} 편집기를 사용하면 EOL을 염두에 두고 파일을 생성하는 데 도움이 될 수 있습니다.  

아래 그림과 같이 Notepad++ 편집기에서 현재 `EOL Conversion` 상태를 확인하고 변환할 수 있습니다. 메뉴는 `편집 > EOL 변환`에 있습니다.  
![Notepad++ - EOL 변환 - `편집 > EOL 변환 > Windows(CR LF) 또는 Unix(LF)`](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-notepad++-eol_conversion-edit_eol_conversion_windows_cr_lf_or_unix_lf.png)  

Notepad++ - EOL 변환 - `편집 > EOL 변환 > Windows(CR LF) 또는 Unix(LF)`
{: style="color:gray; font-size: 80%; text-align: center;"}

### 우분투(리눅스)
Ubuntu 환경에서는 파일의 EOL 상태를 확인하고 변환할 수도 있습니다.  

`file` 도구를 사용하여 파일의 EOL 상태를 확인할 수 있습니다.  

```shell
# PC (CRLF)
$ file pc.txt 
pc.txt: ASCII text, with CRLF line terminators

# Unix (LF)
$ file unix.txt 
unix.txt: ASCII text
```
파일의 EOL 변환을 위해서는 `tofrodos` 및 `dos2unix`가 설치되어 있어야 합니다. `apt`를 사용하여 설치할 수 있습니다.  

```shell
sudo apt-get install tofrodos
sudo apt-get install dos2unix
```
패키지를 설치하면 아래 도구를 사용할 수 있습니다.  
- `dos2unix` : PC(CRLF)를 Unix(LF)로 변환합니다.
- `unix2dos` : 유닉스(LF)를 PC(CRLF)로 변환

아래는 PC(CRLF)를 UNIX(LF)로 변환하는 예입니다.  

```shell
$ file pc.txt 
pc.txt: ASCII text, with CRLF line terminators

$ dos2unix pc.txt 
dos2unix: converting file pc.txt to Unix format...

$ file pc.txt 
pc.txt: ASCII text

```
## Git repo OS 간 EOL 동기화
하나의 Git 저장소에는 Windows 및 Ubuntu 환경에서 파일을 커밋하고 가져올 때 EOL 변환 문제를 방지하는 Git 설정이 있습니다.  

아래 git 명령은 ASCII 형식 파일을 개체 데이터베이스에 삽입하기 전에 CRLF를 LF로 변경합니다. 그래서 주로 `Windows` 환경에서 Git 설정에 사용됩니다.  

```shell
git config --global core.autocrlf input 
```
아래 git 명령은 줄 바꿈을 LF로 사용합니다. 그래서 주로 `Ubuntu(Linux)` 환경에서 사용됩니다.  

```shell
git config --global core.autocrlf true
```
위 명령은 전역 Git 설정이므로 특정 복제된 Repo에만 EOL 설정을 적용하고 싶다면 해당 repo 폴더에 들어가서 `--global` 옵션만 제거하고 명령을 사용하면 됩니다.  

즉, LF 형식의 EOL이 포함된 파일을 Git 서버에 업로드하려는 의도입니다.  

Windows 환경에서는 마우스 오른쪽 버튼 클릭 후 메뉴에서 Git Bash에 접근할 수 있습니다.  
![Windows에서 Git Bash에 액세스하기](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-accessing_git_bash_on_windows.png)  

Windows에서 Git Bash에 액세스하기
{: style="color:gray; font-size: 80%; text-align: center;"}

