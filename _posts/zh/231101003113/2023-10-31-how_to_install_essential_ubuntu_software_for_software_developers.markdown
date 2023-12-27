---
title:  如何为软件开发人员安装必要的 Ubuntu 软件
image:
  path: /assets/images/231101003113/zh-thumb-unclesnote-how_to_install_essential_ubuntu_software_for_software_developers.png
  alt: 如何为软件开发人员安装必要的 Ubuntu 软件
images: ["/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-visual_studio_code.png", "/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-github_desktop.png", "/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-beyond_compare_4.png", "/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-db_browser_for_sqlite.png"]
categories: [乌班图, 工具]
tags: [VisualStudio代码, VS代码, GitHub桌面版, 超越比较4, SQLite数据库浏览器, MySQL工作台, 乌班图, 工具]
description:  如果您是软件开发人员，并且您的开发环境是 Ubuntu，我们将解释如何安装您需要安装的必备 Ubuntu 软件。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-01 00:31:13 +0900
ro_id: 231101003113
ro_name: how_to_install_essential_ubuntu_software_for_software_developers
ro_ref: 231101003113/how_to_install_essential_ubuntu_software_for_software_developers
lang: zh
---
如果您是软件开发人员，并且您的开发环境是 Ubuntu，我们将解释如何安装您需要安装的必备 Ubuntu 软件。  
## 视觉工作室代码

![视觉工作室代码](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-visual_studio_code.png)
_视觉工作室代码_

[Visual Studio Code](https://code.visualstudio.com){:target="_blank"} 是软件开发中广泛使用的 IDE 和编辑器。  

如果您使用的是`Ubuntu桌面GUI(GNOME)环境`，您可以使用内置浏览器下载VS Code并使用`dpkg`工具安装。  

```shell
cd ~/Downloads
sudo dpkg -i code_1.83.0-1696350811_amd64.deb
```
如果您使用`Ubuntu 服务器环境`或`仅具有 SSH 访问权限`，这有点复杂。但是，您可以使用以下命令安装 VS Code。  

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
您可以使用以下命令安装扩展以通过 SSH 远程访问 VS Code。  

```shell
code --install-extension ms-vscode-remote.remote-ssh
```
## GitHub 桌面版

![GitHub 桌面版](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-github_desktop.png)
_GitHub 桌面版_

GitHub 桌面软件是一个 Git 客户端。如果您正在开发 GitHub 项目，这绝对是一个不错的选择，但即使您使用个人 git 服务器而不是 GitHub 存储库，如果您不需要复杂的功能，它也可能是一个不错的选择。  

[官方GitHub桌面](https://desktop.github.com/){:target="_blank"}站点仅提供Windows和macOS版本。但是，由于 GitHub Desktop 是一个开源项目，因此 Ubuntu 版本也分布在单独的 [repo](https://github.com/shiftkey/desktop){:target="_blank"} 中。不确定这是否是官方的。将存储库添加到 apt 后，您可以使用 apt 安装 GitHub Desktop。  

```shell
wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/mwt-desktop.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" > /etc/apt/sources.list.d/mwt-desktop.list'
sudo apt update && sudo apt install github-desktop
```
## 超越比较4

![超越比较4](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-beyond_compare_4.png)
_超越比较4_

Beyond Compare 是一款流行的文件比较工具。  

不幸的是，Beyond Compare 3版本在Ubuntu中没有良好的文件比较性能。换句话说，文件比较需要很长时间。然而，最新版本 [Beyond Compare 4](https://www.scootersoftware.com/download){:target="_blank"} 速度很快，并且在 Ubuntu 中具有与 Windows 相同的性能。所以，我建议在 Ubuntu 上选择版本 4。  

您可以使用网络浏览器从官方网站下载Beyond Compare 4，但我们将使用`wget`工具下载它。  

```shell
wget https://www.scootersoftware.com/files/bcompare-4.4.6.27483_amd64.deb
sudo dpkg -i bcompare-4.4.6.27483_amd64.deb
rm bcompare-4.4.6.27483_amd64.deb
```
安装完成后，使用以下命令重置 Beyond Compare 4。  

```shell
#thinks bensonkb
sudo rm -rf ~/.config/bcompare 
sudo sed -i "s/keexjEP3t4Mue23hrnuPtY4TdcsqNiJL-5174TsUdLmJSIXKfG2NGPwBL6vnRPddT7tH29qpkneX63DO9ECSPE9rzY1zhThHERg8lHM9IBFT+rVuiY823aQJuqzxCKIE1bcDqM4wgW01FH6oCBP1G4ub01xmb4BGSUG6ZrjxWHJyNLyIlGvOhoY2HAYzEtzYGwxFZn2JZ66o4RONkXjX0DF9EzsdUef3UAS+JQ+fCYReLawdjEe6tXCv88GKaaPKWxCeaUL9PejICQgRQOLGOZtZQkLgAelrOtehxz5ANOOqCaJgy2mJLQVLM5SJ9Dli909c5ybvEhVmIC0dc9dWH+/N9KmiLVlKMU7RJqnE+WXEEPI1SgglmfmLc1yVH7dqBb9ehOoKG9UE+HAE1YvH1XX2XVGeEqYUY-Tsk7YBTz0WpSpoYyPgx6Iki5KLtQ5G-aKP9eysnkuOAkrvHU8bLbGtZteGwJarev03PhfCioJL4OSqsmQGEvDbHFEbNl1qJtdwEriR+VNZts9vNNLk7UGfeNwIiqpxjk4Mn09nmSd8FhM4ifvcaIbNCRoMPGl6KU12iseSe+w+1kFsLhX+OhQM8WXcWV10cGqBzQE9OqOLUcg9n0krrR3KrohstS9smTwEx9olyLYppvC0p5i7dAx2deWvM1ZxKNs0BvcXGukR+/g" /usr/lib/beyondcompare/BCompare
```
然后从 Ubuntu GUI 运行 Beyond Compare 4 并输入许可证密钥(如果有)。  

```shell
# Then restart BC, click "Enter License":
ayvZeJDYPBHS4J-1K6g6bDBuPoo0G-oGAq35blZtAoRqC-qQeSz28XAzX
6nTx9laTMLRCp6nAIhHNGZ2ehkeUfbnFaxEeLvI8fJavn-XQLNbOumCLU
qgdNbNMZiFRU03+OTQnw4V-E2YKTYi-LkgPzE6R-yIJGDNWfxH2AdpIgg
8rlpsbrTs9Dt1zysUfvAEi0dKbmGIi3rqf7yWmwDh1AI5VyoWFIejvJwJ
Lmlr2CjQ1VZ3DySCfBDuKcYmOCeK7jzEWPUnAw+f9360nIiiNEB0YGkwB
kdtgaKEEik7aNiI3jXvp5r34wViVJCiX7m2y7pqBV9gZIvP9hP9KPnP++++
```
如果您没有许可证密钥，则可能需要在评估期结束时再次执行重置过程。因此，我建议保存并使用工作区，并在每次更新时导出设置并将其保存为文件。  
## 数据库
### SQLite 数据库浏览器

![SQLite 数据库浏览器](/assets/images/231101003113/unclesnote-how_to_install_essential_ubuntu_software_for_software_developers-db_browser_for_sqlite.png)
_SQLite 数据库浏览器_

如果您使用SQLite DB，[SQLite DB Browser](https://sqlitebrowser.org/dl/){:target="_blank"}是在GUI环境中查询数据库或查看表内容的必备软件。  

您可以将`sqlitebrowser`存储库添加到 apt 并安装 SQLite DB 浏览器。  

```shell
sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser
sudo apt-get update
sudo apt-get install sqlitebrowser
```
### MySQL工作台
稍后我需要在 Ubuntu 上安装 MySQL Workbench 时会对此进行描述。  
