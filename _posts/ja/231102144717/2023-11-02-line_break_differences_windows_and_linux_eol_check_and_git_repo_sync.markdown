---
title:  改行の違い - Windows と Linux の EOL チェックと Git リポジトリ同期
image:
  path: /assets/images/231102144717/ja-thumb-unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync.png
  alt: 改行の違い - Windows と Linux の EOL チェックと Git リポジトリ同期
images: ["/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-same_file_contents_but_different_files,_on_the_left_is_windows_pc_format_and_on_the_right_is_linux_unix_format.png", "/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-notepad++-eol_conversion-edit_eol_conversion_windows_cr_lf_or_unix_lf.png", "/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-accessing_git_bash_on_windows.png"]
categories: [ギット]
tags: [ギット, CRLF, LF, EOL変換, 改行, メモ帳プラスプラス, unix2dos, dos2unix]
description:  Linux と Windows の両方で 1 つの Git リポジトリ内のファイルを変更してコミットする必要がある場合、内容が明らかに変更されていない場合でも、Git クライアントがそのファイルを Git コミット段階で変更されたファイルとして認識する場合があります。問題の原因は、ファイルの内容は同じでも、WindowsとLinuxでは基本的な改行の表現方法が異なることにあります。下の図では、左が Windows (PC) で変更して保存したファイル、右が Linux (UNIX) で変更して保存したファイルです。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 14:47:17 +0900
ro_id: 231102144717
ro_name: line_break_differences_windows_and_linux_eol_check_and_git_repo_sync
ro_ref: 231102144717/line_break_differences_windows_and_linux_eol_check_and_git_repo_sync
lang: ja
---
Linux と Windows の両方で 1 つの Git リポジトリ内のファイルを変更してコミットする必要がある場合、内容が明らかに変更されていない場合でも、Git クライアントがそのファイルを Git コミット段階で変更されたファイルとして認識する場合があります。  

問題の原因は、ファイルの内容は同じでも、WindowsとLinuxでは基本的な改行の表現方法が異なることにあります。下の図では、左が Windows (PC) で変更して保存したファイル、右が Linux (UNIX) で変更して保存したファイルです。  
![ファイル内容は同じですがファイルが異なります。左側は Windows PC 形式、右側は Linux UNIX 形式です](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-same_file_contents_but_different_files,_on_the_left_is_windows_pc_format_and_on_the_right_is_linux_unix_format.png)  

ファイル内容は同じですがファイルが異なります。左側は Windows PC 形式、右側は Linux UNIX 形式です
{: style="color:gray; font-size: 80%; text-align: center;"}

## WindowsとLinuxの改行の違い
ASCII 文字の観点から見ると、  

Windows では、以下のように改行を`CRLF (Carriage Return with Line Feed)`の形式で表現します。  

```text
\r\n
```
UbuntuなどのLinuxシステムでは、以下のように改行は`LF(Line feed)`のみで表現されます。  

```text
\n
```
Git から LF 形式で改行を表すファイルを受け取り、Windows エディターで簡単に変更してから復元したとします。つまり、表面上は同じ内容ですが、CRLFで改行が変更されているため、Git上のファイルとは別のファイルに変換される可能性があります。  

Windows で作成された bash スクリプトを Linux 上で実行すると、デバッグ中に謎のスクリプト実行エラーが発生する可能性があります。これは、Windows および bash 上で改行を CRLF 形式で保存したシェル スクリプトがこれを解釈できなかったことが原因である可能性があります。  
## ファイルのEOL（End Of Line）を確認して変換する
もちろん、Windows でファイルを作成した場合でも、PC (CRLF) 形式ではなく、UNIX (LF) 形式でファイルを作成および変換することができます。その逆も可能です。この変換操作は、一般に`ＥＯＬ（Ｅｎｄ Ｏｆ Ｌｉｎｅｓ）変換`と呼ばれる。  

実際、OS ごとの EOL の違いに初めて遭遇すると、少し混乱するかもしれません。そこで、今後説明する内容に関連するキーワードを以下のように表にマッピングすることができます。  

|名前|ウィンドウズ|Ubuntu (Linux)|
| ------------------------------------------ | -------------------------------------- | -------------- |
|改行フォーマットの用語|CRLF (改行付きキャリッジリターン)|LF（改行）|
|改行表現文字|`\r\n`|`\n`|
|Ubuntuの`file`ツールからの情報|CRLF 行終端文字を含む ASCII テキスト|ASCIIテキスト|
|Beyond Compare ツールの EOL タイプ|パソコン|UNIX|
|UbuntuのEOLタイプ|やるべきこと|ユニックス|
|Ubuntu の EOL 変換ツール|unix2dos|dos2unix|

### ウィンドウズ
[Notepad++](https://notepad-plus-plus.org/downloads){:target="_blank"} エディターを使用すると、EOL を念頭に置いてファイルを作成できます。  

下の図に示すように、Notepad++ エディターで現在の`EOL 変換`ステータスを確認し、変換することができます。メニューは`編集 > EOL 変換`にあります。  
![Notepad++ - EOL 変換 - `編集 > EOL 変換 > Windows (CR LF) または Unix (LF)`](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-notepad++-eol_conversion-edit_eol_conversion_windows_cr_lf_or_unix_lf.png)  

Notepad++ - EOL 変換 - `編集 > EOL 変換 > Windows (CR LF) または Unix (LF)`
{: style="color:gray; font-size: 80%; text-align: center;"}

### Ubuntu (Linux)
Ubuntu環境では、ファイルのEOLステータスを確認して変換することもできます。  

ファイルの EOL ステータスは、`file`ツールを使用して確認できます。  

```shell
# PC (CRLF)
$ file pc.txt 
pc.txt: ASCII text, with CRLF line terminators

# Unix (LF)
$ file unix.txt 
unix.txt: ASCII text
```
ファイルの EOL 変換には、`tofrodos` と `dos2unix` がインストールされている必要があります。 `apt`を使用してインストールできます。  

```shell
sudo apt-get install tofrodos
sudo apt-get install dos2unix
```
パッケージをインストールすると、以下のツールを使用できるようになります。  
- `dos2unix` : PC (CRLF) を Unix (LF) に変換します。
- `unix2dos` : Unix (LF) を PC (CRLF) に変換します。

以下は、PC (CRLF) を UNIX (LF) に変換する例です。  

```shell
$ file pc.txt 
pc.txt: ASCII text, with CRLF line terminators

$ dos2unix pc.txt 
dos2unix: converting file pc.txt to Unix format...

$ file pc.txt 
pc.txt: ASCII text

```
## OS 間の Git リポジトリ EOL 同期
1 つの Git リポジトリには、Windows および Ubuntu 環境でファイルをコミットおよびプルする際の EOL 変換の問題を防ぐ Git 設定があります。  

以下の git コマンドは、ASCII 形式のファイルをオブジェクト データベースに挿入する前に、CRLF を LF に変更します。そのため、主に`Windows`環境での Git 設定に使用されます。  

```shell
git config --global core.autocrlf input 
```
以下の git コマンドは改行を LF として使用します。そのため、主に`Ubuntu (Linux)`環境で使用されます。  

```shell
git config --global core.autocrlf true
```
上記のコマンドはグローバル Git 設定であるため、EOL 設定を特定のクローン リポジトリにのみ適用したい場合は、関連するリポジトリ フォルダーに移動し、`--global` オプションのみを削除してコマンドを使用できます。  

つまり、LF 形式の EOL を持つファイルを Git サーバーにアップロードすることが目的です。  

Windows環境の場合は、右クリックメニューからGit Bashにアクセスできます。  
![Windows での Git Bash へのアクセス](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-accessing_git_bash_on_windows.png)  

Windows での Git Bash へのアクセス
{: style="color:gray; font-size: 80%; text-align: center;"}

