---
title:  Line Break Differences - Windows and Linux EOL Check and Git Repo Sync
image:
  path: /assets/images/231102144717/en-thumb-unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync.png
  alt: Line Break Differences - Windows and Linux EOL Check and Git Repo Sync
images: ["/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-same_file_contents_but_different_files,_on_the_left_is_windows_pc_format_and_on_the_right_is_linux_unix_format.png", "/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-notepad++-eol_conversion-edit_eol_conversion_windows_cr_lf_or_unix_lf.png", "/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-accessing_git_bash_on_windows.png"]
categories: [Git]
tags: [Git, CRLF, LF, EOLConversion, LineBreaks, NotepadPlusPlus, unix2dos, dos2unix]
description:  If you need to modify and commit files in one Git repo on both Linux and Windows, there may be cases where the Git client recognizes the file as a modified file at the Git commit stage even though the content has clearly not been modified. The cause of the problem is that although the file contents are the same, the basic way of expressing line breaks in Windows and Linux is different. In the picture below, the left is a file modified and saved in Windows (PC), and the right is a file modified and saved in Linux (UNIX).
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-02 14:47:17 +0900
ro_id: 231102144717
ro_name: line_break_differences_windows_and_linux_eol_check_and_git_repo_sync
ro_ref: 231102144717/line_break_differences_windows_and_linux_eol_check_and_git_repo_sync
lang: en
---
If you need to modify and commit files in one Git repo on both Linux and Windows, there may be cases where the Git client recognizes the file as a modified file at the Git commit stage even though the content has clearly not been modified.  

The cause of the problem is that although the file contents are the same, the basic way of expressing line breaks in Windows and Linux is different. In the picture below, the left is a file modified and saved in Windows (PC), and the right is a file modified and saved in Linux (UNIX).  
![Same file contents but different files, on the left is Windows PC format and on the right is Linux UNIX format](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-same_file_contents_but_different_files,_on_the_left_is_windows_pc_format_and_on_the_right_is_linux_unix_format.png)  

Same file contents but different files, on the left is Windows PC format and on the right is Linux UNIX format
{: style="color:gray; font-size: 80%; text-align: center;"}

## Differences of line breaks between Windows and Linux
From an ASCII character perspective,  

Windows expresses line breaks in the form of `CRLF (Carriage Return with Line Feed)` as shown below.  

```text
\r\n
```
In Linux systems such as Ubuntu, line breaks are expressed only as `LF (Line feed)` as shown below.  

```text
\n
```
Assume that you received a file expressing newlines in LF format from Git, modified it briefly in a Windows editor, and then restored it. This means that the file has the same content on the surface, but the line breaks are modified with CRLF, so there is a possibility that it will be transformed into a different file from the file in Git.  

If you run a bash script written on Windows on Linux, you may encounter mysterious script execution errors during debugging. This may be because the shell script stored line breaks in CRLF format on Windows and bash could not interpret this.  
## Check and convert EOL (End Of Line) of a file
Of course, even if you write a file in Windows, you can create and convert the file in UNIX (LF) format, not PC (CRLF) format. The opposite is also possible. The conversion operation is commonly called `EOL (End Of Lines) Conversion`.  

In fact, it can be a little confusing when you first encounter the differences in EOL for each OS. So, keywords related to the content to be explained in the future can be mapped to a table as shown below.  

| Name                                       | Windows                                | Ubuntu (Linux) |
| ------------------------------------------ | -------------------------------------- | -------------- |
| line breaks format terminology             | CRLF (Carriage Return with Line Feed)  | LF (Line feed) |
| line breaks representation characters      | `\r\n`                                 | `\n`           |
| Information from the `file` tool in Ubuntu | ASCII text, with CRLF line terminators | ASCII text     |
| EOL type in Beyond Compare tool            | PC                                     | UNIX           |
| EOL type in Ubuntu                         | dos                                    | unix           |
| EOL Conversion Tool on Ubuntu              | unix2dos                               | dos2unix       |

### Windows
Using the [Notepad++](https://notepad-plus-plus.org/downloads){:target="_blank"} editor can help you create files with EOL in mind.  

As shown in the picture below, you can check the current `EOL Conversion` status in Notepad++ editor and convert. The menu is in `Edit > EOL Conversion`.  
![Notepad++ - EOL Conversion - `Edit > EOL Conversion > Windows (CR LF) Or Unix (LF)`](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-notepad++-eol_conversion-edit_eol_conversion_windows_cr_lf_or_unix_lf.png)  

Notepad++ - EOL Conversion - `Edit > EOL Conversion > Windows (CR LF) Or Unix (LF)`
{: style="color:gray; font-size: 80%; text-align: center;"}

### Ubuntu (Linux)
In the Ubuntu environment, you can also check the EOL status of files and convert them.  

You can check the EOL status of a file using the `file` tool.  

```shell
# PC (CRLF)
$ file pc.txt 
pc.txt: ASCII text, with CRLF line terminators

# Unix (LF)
$ file unix.txt 
unix.txt: ASCII text
```
For EOL conversion of files, `tofrodos` and `dos2unix` must be installed. It can be installed using `apt`.  

```shell
sudo apt-get install tofrodos
sudo apt-get install dos2unix
```
Once you install the packages, you can use the tools below.  
- `dos2unix` : Convert PC (CRLF) to Unix (LF)
- `unix2dos` : Convert Unix (LF) to PC (CRLF)

Below is an example of converting PC (CRLF) to UNIX (LF).  

```shell
$ file pc.txt 
pc.txt: ASCII text, with CRLF line terminators

$ dos2unix pc.txt 
dos2unix: converting file pc.txt to Unix format...

$ file pc.txt 
pc.txt: ASCII text

```
## Git repo EOL synchronization between OSs
There is a Git setting in one Git repo that prevents EOL conversion issues when committing and pulling files in Windows and Ubuntu environments.  

The git command below changes CRLF to LF before inserting an ASCII format file into the object database. So it is mainly used for Git settings in a `Windows` environment.  

```shell
git config --global core.autocrlf input 
```
The git command below uses line breaks as LF. So it is mainly used in `Ubuntu (Linux)` environment.  

```shell
git config --global core.autocrlf true
```
Since the above command is a global Git setting, if you want the EOL settings to be applied only to a specific cloned repo, you can go into the relevant repo folder and use the command with only the `--global` option removed.  

In other words, the intention is to upload files with an EOL in LF format to the Git server.  

In a Windows environment, you can access Git Bash from the menu after right-clicking.  
![Accessing Git Bash on Windows](/assets/images/231102144717/unclesnote-line_break_differences_windows_and_linux_eol_check_and_git_repo_sync-accessing_git_bash_on_windows.png)  

Accessing Git Bash on Windows
{: style="color:gray; font-size: 80%; text-align: center;"}

