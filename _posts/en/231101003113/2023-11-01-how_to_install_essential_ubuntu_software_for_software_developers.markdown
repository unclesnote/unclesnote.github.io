---
title:  How to install essential Ubuntu software for software developers
image:
  path: /assets/images/231101003113/en-thumb-unclesnote-how_to_install_essential_ubuntu_software_for_software_developers.png
  alt: How to install essential Ubuntu software for software developers
images: ["/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-visual_studio_code.png", "/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-github_desktop.png", "/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-beyond_compare_4.png", "/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-db_browser_for_sqlite.png"]
categories: [Ubuntu, Tools]
tags: [VisualStudioCode, VSCode, GitHubDesktop, BeyondCompare4, SQLiteDBBrowser, MySQLWorkbench, Ubuntu, Tools]
description:  If you are a software developer, and your development environment is Ubuntu, we will explain how to install the essential Ubuntu software you need to install.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-01 00:31:13 +0900
ro_id: 231101003113
ro_name: how_to_install_essential_ubuntu_software_for_software_developers
ro_ref: 231101003113/how_to_install_essential_ubuntu_software_for_software_developers
lang: en
---
If you are a software developer, and your development environment is Ubuntu, we will explain how to install the essential Ubuntu software you need to install.  
## Visual Studio Code
![Visual Studio Code](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-visual_studio_code.png)
_Visual Studio Code_

[Visual Studio Code](https://code.visualstudio.com){:target="_blank"} is a widely used IDE and editor in software development.  

If you are using `the Ubuntu desktop GUI (GNOME) environment`, you can download VS Code using the built-in browser and install it using the `dpkg` tool.  

```shell
cd ~/Downloads
sudo dpkg -i code_1.83.0-1696350811_amd64.deb
```
If you are using `an Ubuntu server environment` or `only have SSH access`, this is a bit complicated. However, you can install VS Code using the commands below.  

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
You can install the extension for remote access to VS Code via SSH using the command below.  

```shell
code --install-extension ms-vscode-remote.remote-ssh
```
## GitHub Desktop
![GitHub Desktop](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-github_desktop.png)
_GitHub Desktop_

GitHub desktop software is a Git client. If you're working on a GitHub project, this is definitely a good option, but even if you use a personal git server rather than a GitHub repo, it may also be a good option if you don't need complex features.  

[The official GitHub desktop](https://desktop.github.com/){:target="_blank"} site only provides Windows and macOS versions. However, because GitHub Desktop is an open source project, the Ubuntu version is also distributed in a separate [repo](https://github.com/shiftkey/desktop){:target="_blank"}. Not sure if this is official. After adding the repository to apt, you can install GitHub Desktop using apt.  

```shell
wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/mwt-desktop.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" > /etc/apt/sources.list.d/mwt-desktop.list'
sudo apt update && sudo apt install github-desktop
```
## Beyond Compare 4
![Beyond Compare 4](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-beyond_compare_4.png)
_Beyond Compare 4_

Beyond Compare is a popular file comparison tool.  

Unfortunately, the Beyond Compare 3 version does not have good file comparison performance in Ubuntu. In other words, file comparison takes a long time. However, The latest version, [Beyond Compare 4](https://www.scootersoftware.com/download){:target="_blank"} is fast and has the same performance as Windows in Ubuntu. So, I recommend choosing version 4 on Ubuntu.  

You can download Beyond Compare 4 from the official website using a web browser, but we will download it using the `wget` tool.  

```shell
wget https://www.scootersoftware.com/files/bcompare-4.4.6.27483_amd64.deb
sudo dpkg -i bcompare-4.4.6.27483_amd64.deb
rm bcompare-4.4.6.27483_amd64.deb
```
Once installation is complete, reset Beyond Compare 4 using the command below.  

```shell
#thinks bensonkb
sudo rm -rf ~/.config/bcompare 
sudo sed -i "s/keexjEP3t4Mue23hrnuPtY4TdcsqNiJL-5174TsUdLmJSIXKfG2NGPwBL6vnRPddT7tH29qpkneX63DO9ECSPE9rzY1zhThHERg8lHM9IBFT+rVuiY823aQJuqzxCKIE1bcDqM4wgW01FH6oCBP1G4ub01xmb4BGSUG6ZrjxWHJyNLyIlGvOhoY2HAYzEtzYGwxFZn2JZ66o4RONkXjX0DF9EzsdUef3UAS+JQ+fCYReLawdjEe6tXCv88GKaaPKWxCeaUL9PejICQgRQOLGOZtZQkLgAelrOtehxz5ANOOqCaJgy2mJLQVLM5SJ9Dli909c5ybvEhVmIC0dc9dWH+/N9KmiLVlKMU7RJqnE+WXEEPI1SgglmfmLc1yVH7dqBb9ehOoKG9UE+HAE1YvH1XX2XVGeEqYUY-Tsk7YBTz0WpSpoYyPgx6Iki5KLtQ5G-aKP9eysnkuOAkrvHU8bLbGtZteGwJarev03PhfCioJL4OSqsmQGEvDbHFEbNl1qJtdwEriR+VNZts9vNNLk7UGfeNwIiqpxjk4Mn09nmSd8FhM4ifvcaIbNCRoMPGl6KU12iseSe+w+1kFsLhX+OhQM8WXcWV10cGqBzQE9OqOLUcg9n0krrR3KrohstS9smTwEx9olyLYppvC0p5i7dAx2deWvM1ZxKNs0BvcXGukR+/g" /usr/lib/beyondcompare/BCompare
```
Then run Beyond Compare 4 from the Ubuntu GUI and enter the license key if you have it.  

```shell
# Then restart BC, click "Enter License":
ayvZeJDYPBHS4J-1K6g6bDBuPoo0G-oGAq35blZtAoRqC-qQeSz28XAzX
6nTx9laTMLRCp6nAIhHNGZ2ehkeUfbnFaxEeLvI8fJavn-XQLNbOumCLU
qgdNbNMZiFRU03+OTQnw4V-E2YKTYi-LkgPzE6R-yIJGDNWfxH2AdpIgg
8rlpsbrTs9Dt1zysUfvAEi0dKbmGIi3rqf7yWmwDh1AI5VyoWFIejvJwJ
Lmlr2CjQ1VZ3DySCfBDuKcYmOCeK7jzEWPUnAw+f9360nIiiNEB0YGkwB
kdtgaKEEik7aNiI3jXvp5r34wViVJCiX7m2y7pqBV9gZIvP9hP9KPnP++++
```
If you do not have a license key, you may need to perform the reset process again when the evaluation period ends. So, I recommend saving and using the workspace and exporting the settings every time it is updated and saving it as a file.  
## Database
### DB Browser for SQLite
![DB Browser for SQLite](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-db_browser_for_sqlite.png)
_DB Browser for SQLite_

If you use SQLite DB, [SQLite DB Browser](https://sqlitebrowser.org/dl/){:target="_blank"} is essential software for querying the database or viewing table contents in a GUI environment.  

You can add the `sqlitebrowser` repo to apt and install the SQLite DB browser.  

```shell
sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser
sudo apt-get update
sudo apt-get install sqlitebrowser
```
### MySQL Workbench
I will describe this later when I need to install MySQL Workbench on Ubuntu.  
