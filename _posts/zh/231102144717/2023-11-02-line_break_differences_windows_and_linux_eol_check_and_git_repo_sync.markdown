---
title:  换行符差异 - Windows 和 Linux EOL 检查和 Git Repo 同步
image:
  path: /assets/images/231102144717/zh-thumb-unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync.png
  alt: 换行符差异 - Windows 和 Linux EOL 检查和 Git Repo 同步
images: ["/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-same_file_contents_but_different_files,_on_the_left_is_windows_pc_format_and_on_the_right_is_linux_unix_format.png", "/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-notepad++-eol_conversion-edit_eol_conversion_windows_cr_lf_or_unix_lf.png", "/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-accessing_git_bash_on_windows.png"]
categories: [git]
tags: [git, 回车换行, 如果, EOL转换, 换行符, 记事本PlusPlus, UNIX2DOS, DOS2UNIX]
description:  如果您需要在 Linux 和 Windows 上修改并提交同一个 Git 存储库中的文件，则可能会出现这样的情况：Git 客户端在 Git 提交阶段将该文件识别为已修改文件，即使该文件的内容显然没有被修改。问题的原因在于，虽然文件内容相同，但 Windows 和 Linux 中表达换行符的基本方式不同。下图中，左边是
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 14:47:17 +0900
ro_id: 231102144717
ro_name: line_break_differences_windows_and_linux_eol_check_and_git_repo_sync
ro_ref: 231102144717/line_break_differences_windows_and_linux_eol_check_and_git_repo_sync
lang: zh
---
如果您需要在 Linux 和 Windows 上修改并提交同一个 Git 存储库中的文件，则可能会出现这样的情况：Git 客户端在 Git 提交阶段将该文件识别为已修改文件，即使该文件的内容显然没有被修改。  

问题的原因在于，虽然文件内容相同，但 Windows 和 Linux 中表达换行符的基本方式不同。下图中，左边是在Windows（PC）下修改并保存的文件，右边是在Linux（UNIX）下修改并保存的文件。  
![文件内容相同但文件不同，左边是Windows PC格式，右边是Linux UNIX格式](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-same_file_contents_but_different_files,_on_the_left_is_windows_pc_format_and_on_the_right_is_linux_unix_format.png)  

文件内容相同但文件不同，左边是Windows PC格式，右边是Linux UNIX格式
{: style="color:gray; font-size: 80%; text-align: center;"}

## Windows和Linux换行符的区别
从 ASCII 字符的角度来看，  

Windows 以`CRLF（回车换行）`的形式表示换行符，如下所示。  

```text
\r\n
```
在 Ubuntu 等 Linux 系统中，换行符仅表示为`LF（换行）`，如下所示。  

```text
\n
```
假设您从 Git 收到一个以 LF 格式表示换行符的文件，在 Windows 编辑器中对其进行了简短修改，然后将其恢复。这意味着该文件表面上内容相同，但换行符被CRLF修改，因此有可能会转化为与Git中的文件不同的文件。  

如果你在Linux上运行在Windows上编写的bash脚本，你可能会在调试过程中遇到神秘的脚本执行错误。这可能是因为 shell 脚本在 Windows 上以 CRLF 格式存储换行符，而 bash 无法解释这一点。  
## 检查并转换文件的 EOL（行尾）
当然，即使您在Windows中编写文件，您也可以创建并转换UNIX（LF）格式的文件，而不是PC（CRLF）格式。相反的情况也是可能的。该转换操作通常称为`EOL（行尾）转换`。  

事实上，当您第一次遇到每个操作系统的 EOL 差异时，可能会有点困惑。因此，与以后要解释的内容相关的关键词可以映射到如下所示的表格中。  

|姓名|视窗|乌班图（Linux）|
| ------------------------------------------ | -------------------------------------- | -------------- |
|换行符格式术语|CRLF（回车换行）|LF（换行）|
|换行符表示字符|`\r\n`|`\n`|
|来自 Ubuntu 中`file`工具的信息|ASCII 文本，带有 CRLF 行终止符|ASCII 文本|
|Beyond Compare 工具中的 EOL 类型|个人电脑|UNIX系统|
|Ubuntu 中的 EOL 类型|DOS|UNIX|
|Ubuntu 上的 EOL 转换工具|UNIX2DOS|DOS2UNIX|

### 视窗
使用 [Notepad++](https://notepad-plus-plus.org/downloads){:target="_blank"} 编辑器可以帮助您创建 EOL 的文件。  

如下图所示，您可以在Notepad++编辑器中查看当前`EOL Conversion`状态并进行转换。菜单位于`编辑 > EOL 转换`。  
![Notepad++ - EOL 转换 - `编辑 > EOL 转换 > Windows (CR LF) 或 Unix (LF)`](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-notepad++-eol_conversion-edit_eol_conversion_windows_cr_lf_or_unix_lf.png)  

Notepad++ - EOL 转换 - `编辑 > EOL 转换 > Windows (CR LF) 或 Unix (LF)`
{: style="color:gray; font-size: 80%; text-align: center;"}

### 乌班图（Linux）
在Ubuntu环境中，您还可以检查文件的EOL状态并进行转换。  

您可以使用`file`工具检查文件的 EOL 状态。  

```shell
# PC (CRLF)
$ file pc.txt 
pc.txt: ASCII text, with CRLF line terminators

# Unix (LF)
$ file unix.txt 
unix.txt: ASCII text
```
对于文件的 EOL 转换，必须安装 `tofrodos` 和 `dos2unix`。可以使用`apt`安装它。  

```shell
sudo apt-get install tofrodos
sudo apt-get install dos2unix
```
安装软件包后，您可以使用以下工具。  
- `dos2unix` : 将 PC (CRLF) 转换为 Unix (LF)
- `unix2dos` : 将 Unix (LF) 转换为 PC (CRLF)

下面是将 PC (CRLF) 转换为 UNIX (LF) 的示例。  

```shell
$ file pc.txt 
pc.txt: ASCII text, with CRLF line terminators

$ dos2unix pc.txt 
dos2unix: converting file pc.txt to Unix format...

$ file pc.txt 
pc.txt: ASCII text

```
## 操作系统之间的 Git 存储库 EOL 同步
Git 存储库中有一项 Git 设置，可防止在 Windows 和 Ubuntu 环境中提交和拉取文件时出现 EOL 转换问题。  

下面的 git 命令在将 ASCII 格式文件插入对象数据库之前将 CRLF 更改为 LF。所以主要用于`Windows`环境下的Git设置。  

```shell
git config --global core.autocrlf input 
```
下面的 git 命令使用换行符作为 LF。所以主要用于`Ubuntu(Linux)`环境。  

```shell
git config --global core.autocrlf true
```
由于上述命令是全局 Git 设置，因此如果您希望 EOL 设置仅应用于特定的克隆存储库，则可以进入相关存储库文件夹并使用仅删除`--global`选项的命令。  

换句话说，目的是将带有 LF 格式的 EOL 的文件上传到 Git 服务器。  

在Windows环境下，右键单击菜单即可访问Git Bash。  
![在 Windows 上访问 Git Bash](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-accessing_git_bash_on_windows.png)  

在 Windows 上访问 Git Bash
{: style="color:gray; font-size: 80%; text-align: center;"}

