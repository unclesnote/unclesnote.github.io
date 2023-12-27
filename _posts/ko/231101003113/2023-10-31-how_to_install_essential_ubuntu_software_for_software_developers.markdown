---
title:  소프트웨어 개발자를 위한 필수 Ubuntu 소프트웨어를 설치하는 방법
image:
  path: /assets/images/231101003113/ko-thumb-unclesnote-how_to_install_essential_ubuntu_software_for_software_developers.png
  alt: 소프트웨어 개발자를 위한 필수 Ubuntu 소프트웨어를 설치하는 방법
images: ["/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-visual_studio_code.png", "/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-github_desktop.png", "/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-beyond_compare_4.png", "/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-db_browser_for_sqlite.png"]
categories: [우분투, 도구]
tags: [VisualStudio코드, VSCode, GitHub데스크톱, 비욘드컴페어4, SQLiteDB브라우저, MySQL워크벤치, 우분투, 도구]
description:  소프트웨어 개발자이고 개발 환경이 Ubuntu인 경우, 설치해야 하는 필수 Ubuntu 소프트웨어 설치 방법을 설명합니다.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-01 00:31:13 +0900
ro_id: 231101003113
ro_name: how_to_install_essential_ubuntu_software_for_software_developers
ro_ref: 231101003113/how_to_install_essential_ubuntu_software_for_software_developers
lang: ko
---
소프트웨어 개발자이고 개발 환경이 Ubuntu인 경우, 설치해야 하는 필수 Ubuntu 소프트웨어 설치 방법을 설명합니다.  
## 비주얼 스튜디오 코드
![비주얼 스튜디오 코드](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-visual_studio_code.png)
_비주얼 스튜디오 코드_

[Visual Studio Code](https://code.visualstudio.com){:target="_blank"}는 소프트웨어 개발에서 널리 사용되는 IDE 및 편집기입니다.  

`Ubuntu Desktop GUI(GNOME) 환경`을 사용하는 경우 내장 브라우저를 사용하여 VS Code를 다운로드하고 `dpkg` 도구를 사용하여 설치할 수 있습니다.  

```shell
cd ~/Downloads
sudo dpkg -i code_1.83.0-1696350811_amd64.deb
```
`Ubuntu 서버 환경`을 사용하거나 `SSH 액세스만 가능`을 사용하는 경우 이는 다소 복잡합니다. 그러나 아래 명령을 사용하여 VS Code를 설치할 수 있습니다.  

```shell
# Install basic packages for installation
sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
# Install the Microsoft GPG key and add the repository to apt
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
# Install VS Code
sudo apt update
sudo apt install code
```
아래 명령을 사용하여 SSH를 통해 VS Code에 원격으로 액세스하기 위한 확장 프로그램을 설치할 수 있습니다.  

```shell
code --install-extension ms-vscode-remote.remote-ssh
```
## GitHub 데스크탑
![GitHub 데스크탑](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-github_desktop.png)
_GitHub 데스크탑_

GitHub 데스크톱 소프트웨어는 Git 클라이언트입니다. GitHub 프로젝트를 작업 중이라면 분명 좋은 옵션이지만, GitHub repo가 ​​아닌 개인용 git 서버를 사용하더라도 복잡한 기능이 필요하지 않다면 좋은 옵션이 될 수도 있습니다.  

[공식 GitHub 데스크톱](https://desktop.github.com/){:target="_blank"} 사이트에서는 Windows 및 macOS 버전만 제공합니다. 하지만 GitHub Desktop은 오픈소스 프로젝트이기 때문에 Ubuntu 버전도 별도의 [repo](https://github.com/shiftkey/desktop){:target="_blank"}로 배포됩니다. 이것이 공식적인 것인지 확실하지 않습니다. apt에 저장소를 추가한 후 apt를 사용하여 GitHub Desktop을 설치할 수 있습니다.  

```shell
wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/mwt-desktop.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" > /etc/apt/sources.list.d/mwt-desktop.list'
sudo apt update && sudo apt install github-desktop
```
## 비욘드 컴페어 4
![비욘드 컴페어 4](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-beyond_compare_4.png)
_비욘드 컴페어 4_

Beyond Compare는 널리 사용되는 파일 비교 도구입니다.  

안타깝게도 Beyond Compare 3 버전은 Ubuntu에서 파일 비교 성능이 좋지 않습니다. 즉, 파일 비교에 시간이 오래 걸립니다. 하지만 최신 버전인 [Beyond Compare 4](https://www.scootersoftware.com/download){:target="_blank"}는 속도가 빠르고 Ubuntu에서 Windows와 동일한 성능을 제공합니다. 따라서 Ubuntu에서는 버전 4를 선택하는 것이 좋습니다.  

Beyond Compare 4는 웹브라우저를 이용하여 공식 홈페이지에서 다운로드할 수 있으나, 저희는 `wget` 툴을 이용하여 다운로드하겠습니다.  

```shell
wget https://www.scootersoftware.com/files/bcompare-4.4.6.27483_amd64.deb
sudo dpkg -i bcompare-4.4.6.27483_amd64.deb
rm bcompare-4.4.6.27483_amd64.deb
```
설치가 완료되면 아래 명령을 사용하여 Beyond Compare 4를 재설정하세요.  

```shell
#thinks bensonkb
sudo rm -rf ~/.config/bcompare 
sudo sed -i "s/keexjEP3t4Mue23hrnuPtY4TdcsqNiJL-5174TsUdLmJSIXKfG2NGPwBL6vnRPddT7tH29qpkneX63DO9ECSPE9rzY1zhThHERg8lHM9IBFT+rVuiY823aQJuqzxCKIE1bcDqM4wgW01FH6oCBP1G4ub01xmb4BGSUG6ZrjxWHJyNLyIlGvOhoY2HAYzEtzYGwxFZn2JZ66o4RONkXjX0DF9EzsdUef3UAS+JQ+fCYReLawdjEe6tXCv88GKaaPKWxCeaUL9PejICQgRQOLGOZtZQkLgAelrOtehxz5ANOOqCaJgy2mJLQVLM5SJ9Dli909c5ybvEhVmIC0dc9dWH+/N9KmiLVlKMU7RJqnE+WXEEPI1SgglmfmLc1yVH7dqBb9ehOoKG9UE+HAE1YvH1XX2XVGeEqYUY-Tsk7YBTz0WpSpoYyPgx6Iki5KLtQ5G-aKP9eysnkuOAkrvHU8bLbGtZteGwJarev03PhfCioJL4OSqsmQGEvDbHFEbNl1qJtdwEriR+VNZts9vNNLk7UGfeNwIiqpxjk4Mn09nmSd8FhM4ifvcaIbNCRoMPGl6KU12iseSe+w+1kFsLhX+OhQM8WXcWV10cGqBzQE9OqOLUcg9n0krrR3KrohstS9smTwEx9olyLYppvC0p5i7dAx2deWvM1ZxKNs0BvcXGukR+/g" /usr/lib/beyondcompare/BCompare
```
그런 다음 Ubuntu GUI에서 Beyond Compare 4를 실행하고 라이센스 키가 있으면 입력하세요.  

```shell
# Then restart BC, click "Enter License":
ayvZeJDYPBHS4J-1K6g6bDBuPoo0G-oGAq35blZtAoRqC-qQeSz28XAzX
6nTx9laTMLRCp6nAIhHNGZ2ehkeUfbnFaxEeLvI8fJavn-XQLNbOumCLU
qgdNbNMZiFRU03+OTQnw4V-E2YKTYi-LkgPzE6R-yIJGDNWfxH2AdpIgg
8rlpsbrTs9Dt1zysUfvAEi0dKbmGIi3rqf7yWmwDh1AI5VyoWFIejvJwJ
Lmlr2CjQ1VZ3DySCfBDuKcYmOCeK7jzEWPUnAw+f9360nIiiNEB0YGkwB
kdtgaKEEik7aNiI3jXvp5r34wViVJCiX7m2y7pqBV9gZIvP9hP9KPnP++++
```
라이센스 키가 없는 경우 평가 기간이 종료되면 재설정 프로세스를 다시 수행해야 할 수도 있습니다. 그래서 워크스페이스를 저장해서 사용하고, 업데이트될 때마다 설정을 내보내어 파일로 저장하는 것을 추천드립니다.  
## 데이터 베이스
### SQLite용 DB 브라우저
![SQLite용 DB 브라우저](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-db_browser_for_sqlite.png)
_SQLite용 DB 브라우저_

SQLite DB를 사용하신다면 [SQLite DB 브라우저](https://sqlitebrowser.org/dl/){:target="_blank"}는 GUI 환경에서 데이터베이스를 쿼리하거나 테이블 내용을 보기 위한 필수 소프트웨어입니다.  

`sqlitebrowser` 저장소를 apt에 추가하고 SQLite DB 브라우저를 설치할 수 있습니다.  

```shell
sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser
sudo apt-get update
sudo apt-get install sqlitebrowser
```
### MySQL 워크벤치
이에 대해서는 나중에 Ubuntu에 MySQL Workbench를 설치해야 할 때 설명하겠습니다.  
