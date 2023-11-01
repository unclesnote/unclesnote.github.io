---
title:  ソフトウェア開発者向けに必須の Ubuntu ソフトウェアをインストールする方法
image:
  path: /assets/images/231101003113/ja-thumb-basic_setting_-_developer-visual-studio-code.png
  alt: ソフトウェア開発者向けに必須の Ubuntu ソフトウェアをインストールする方法
images: ["/assets/images/231101003113/basic_setting_-_developer-visual-studio-code.png", "/assets/images/231101003113/basic_setting_-_developer-github-desktop.png", "/assets/images/231101003113/basic_setting_-_developer-beyond-compare-4.png", "/assets/images/231101003113/basic_setting_-_developer-sqlite-db-browser.png"]
categories: [Ubuntu, ツール]
tags: [ビジュアルスタジオコード, VSコード, GitHubデスクトップ, BeyondCompare4, SQLiteDBブラウザ, MySQLワークベンチ, Ubuntu, ツール]
description:  あなたがソフトウェア開発者で、開発環境が Ubuntu である場合に、インストールする必要がある必須の Ubuntu ソフトウェアをインストールする方法を説明します。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-01 00:31:13 +0900
ro_id: 231101003113
ro_name: how_to_install_essential_ubuntu_software_for_software_developers
ro_ref: 231101003113/how_to_install_essential_ubuntu_software_for_software_developers
lang: ja
---
あなたがソフトウェア開発者で、開発環境が Ubuntu である場合に、インストールする必要がある必須の Ubuntu ソフトウェアをインストールする方法を説明します。  
## Visual Studioコード
![Visual Studioコード](/assets/images/231101003113/basic_setting_-_developer-visual-studio-code.png)  

Visual Studioコード
{: style="color:gray; font-size: 80%; text-align: center;"}

[Visual Studio Code](https://code.visualstudio.com){:target="_blank"} は、ソフトウェア開発で広く使用されている IDE およびエディタです。  
`Ubuntu デスクトップ GUI (GNOME) 環境`を使用している場合は、組み込みブラウザを使用して VS Code をダウンロードし、`dpkg`ツールを使用してインストールできます。  

```shell
cd ~/Downloads
sudo dpkg -i code_1.83.0-1696350811_amd64.deb
```
`Ubuntu サーバー環境`を使用している場合、または`SSH アクセスのみ`を使用している場合、これは少し複雑です。ただし、以下のコマンドを使用して VS Code をインストールできます。  

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
以下のコマンドを使用して、SSH 経由で VS Code にリモート アクセスするための拡張機能をインストールできます。  

```shell
code --install-extension ms-vscode-remote.remote-ssh
```
## GitHub デスクトップ
![GitHub デスクトップ](/assets/images/231101003113/basic_setting_-_developer-github-desktop.png)  

GitHub デスクトップ
{: style="color:gray; font-size: 80%; text-align: center;"}

GitHub デスクトップ ソフトウェアは Git クライアントです。 GitHub プロジェクトに取り組んでいる場合、これは間違いなく良い選択肢ですが、GitHub リポジトリではなく個人用の Git サーバーを使用している場合でも、複雑な機能が必要ない場合は良い選択肢になる可能性があります。  
[公式 GitHub デスクトップ](https://desktop.github.com/){:target="_blank"} サイトでは、Windows バージョンと macOS バージョンのみが提供されます。ただし、GitHub Desktop はオープンソース プロジェクトであるため、Ubuntu バージョンも別の [リポジトリ](https://github.com/shiftkey/desktop){:target="_blank"} で配布されます。これが公式かどうかはわかりません。リポジトリを apt に追加した後、apt を使用して GitHub Desktop をインストールできます。  

```shell
wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/mwt-desktop.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" > /etc/apt/sources.list.d/mwt-desktop.list'
sudo apt update && sudo apt install github-desktop
```
## 比較を超えて 4
![比較を超えて 4](/assets/images/231101003113/basic_setting_-_developer-beyond-compare-4.png)  

比較を超えて 4
{: style="color:gray; font-size: 80%; text-align: center;"}

Beyond Compare は、人気のあるファイル比較ツールです。  
残念ながら、Beyond Compare 3 バージョンは、Ubuntu でのファイル比較パフォーマンスが良好ではありません。つまり、ファイルの比較には時間がかかります。ただし、最新バージョンの [Beyond Compare 4](https://www.scootersoftware.com/download){:target="_blank"} は高速で、Ubuntu の Windows と同等のパフォーマンスを備えています。したがって、Ubuntu ではバージョン 4 を選択することをお勧めします。  
Beyond Compare 4 は Web ブラウザを使用して公式 Web サイトからダウンロードできますが、ここでは`wget`ツールを使用してダウンロードします。  

```shell
wget https://www.scootersoftware.com/files/bcompare-4.4.6.27483_amd64.deb
sudo dpkg -i bcompare-4.4.6.27483_amd64.deb
rm bcompare-4.4.6.27483_amd64.deb
```
インストールが完了したら、以下のコマンドを使用して Beyond Compare 4 をリセットします。  

```shell
sudo rm -rf ~/.config/bcompare #thinks bensonkb
sudo sed -i "s/keexjEP3t4Mue23hrnuPtY4TdcsqNiJL-5174TsUdLmJSIXKfG2NGPwBL6vnRPddT7tH29qpkneX63DO9ECSPE9rzY1zhThHERg8lHM9IBFT+rVuiY823aQJuqzxCKIE1bcDqM4wgW01FH6oCBP1G4ub01xmb4BGSUG6ZrjxWHJyNLyIlGvOhoY2HAYzEtzYGwxFZn2JZ66o4RONkXjX0DF9EzsdUef3UAS+JQ+fCYReLawdjEe6tXCv88GKaaPKWxCeaUL9PejICQgRQOLGOZtZQkLgAelrOtehxz5ANOOqCaJgy2mJLQVLM5SJ9Dli909c5ybvEhVmIC0dc9dWH+/N9KmiLVlKMU7RJqnE+WXEEPI1SgglmfmLc1yVH7dqBb9ehOoKG9UE+HAE1YvH1XX2XVGeEqYUY-Tsk7YBTz0WpSpoYyPgx6Iki5KLtQ5G-aKP9eysnkuOAkrvHU8bLbGtZteGwJarev03PhfCioJL4OSqsmQGEvDbHFEbNl1qJtdwEriR+VNZts9vNNLk7UGfeNwIiqpxjk4Mn09nmSd8FhM4ifvcaIbNCRoMPGl6KU12iseSe+w+1kFsLhX+OhQM8WXcWV10cGqBzQE9OqOLUcg9n0krrR3KrohstS9smTwEx9olyLYppvC0p5i7dAx2deWvM1ZxKNs0BvcXGukR+/g" /usr/lib/beyondcompare/BCompare
```
次に、Ubuntu GUI から Beyond Compare 4 を実行し、ライセンス キーがある場合はそれを入力します。  

```shell
# Then restart BC, click "Enter License":
ayvZeJDYPBHS4J-1K6g6bDBuPoo0G-oGAq35blZtAoRqC-qQeSz28XAzX
6nTx9laTMLRCp6nAIhHNGZ2ehkeUfbnFaxEeLvI8fJavn-XQLNbOumCLU
qgdNbNMZiFRU03+OTQnw4V-E2YKTYi-LkgPzE6R-yIJGDNWfxH2AdpIgg
8rlpsbrTs9Dt1zysUfvAEi0dKbmGIi3rqf7yWmwDh1AI5VyoWFIejvJwJ
Lmlr2CjQ1VZ3DySCfBDuKcYmOCeK7jzEWPUnAw+f9360nIiiNEB0YGkwB
kdtgaKEEik7aNiI3jXvp5r34wViVJCiX7m2y7pqBV9gZIvP9hP9KPnP++++
```
ライセンス キーをお持ちでない場合は、評価期間が終了したときに再度リセット プロセスを実行する必要がある場合があります。そのため、ワークスペースを保存して使用し、更新されるたびに設定をエクスポートしてファイルとして保存することをお勧めします。  
## データベース
### SQLite用DBブラウザ
![SQLite用DBブラウザ](/assets/images/231101003113/basic_setting_-_developer-sqlite-db-browser.png)  

SQLite用DBブラウザ
{: style="color:gray; font-size: 80%; text-align: center;"}

SQLite DB を使用する場合、[SQLite DB Browser](https://sqlitebrowser.org/dl/){:target="_blank"} は、GUI 環境でデータベースのクエリやテーブルの内容の表示に必須のソフトウェアです。  
`sqlitebrowser` リポジトリを apt に追加し、SQLite DB ブラウザをインストールできます。  

```shell
sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser
sudo apt-get update
sudo apt-get install sqlitebrowser
```
### MySQL ワークベンチ
これについては、後で MySQL Workbench を Ubuntu にインストールする必要があるときに説明します。  
