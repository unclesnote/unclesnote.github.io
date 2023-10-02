---
title:  How to create a C development environment using VS Code in Ubuntu
categories: [C Sharp, VS Code]
tags: [CSharp, Development, VisualStudio, VSCode]
description:  C# software can be developed in Visual Studio on Windows in general. However, it can also be developed in Ubuntu environments. A well-known IDE is MonoDevelop provided by the Mono project. However, let's create a VS Code C# software development environment  that uses more than this. Based on Ubuntu 20.04.
toc: false
# Below is readonly values if it's decided once
layout: post
date: 2023-09-28 21:34:23 +0900
ro_id: 230928213423
ro_name: how_to_create_a_c_development_environment_using_vs_code_in_ubuntu
ro_ref: 230928213423/how_to_create_a_c_development_environment_using_vs_code_in_ubuntu
lang: en
---
C# software can be developed in Visual Studio on Windows in general. However, it can also be developed in Ubuntu environments. A well-known IDE is MonoDevelop provided by the Mono project. However, let's create a VS Code C# software development environment  that uses more than this. Based on Ubuntu 20.04.  
## Install .NET family
First, we will add a repository that contains .net. And we will install the three below, and the other three were installed together just by installing the .NET SDK. Please look at the other two for confirmation purposes.  
- .NET SDK
- .NET Core
- ASP.NET Core

```shell
cd ~/
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
# .NET SDK
sudo apt install -y dotnet-sdk-6.0
# .NET Core
sudo apt install -y dotnet-runtime-6.0
# ASP.NET Core
sudo apt install -y aspnetcore-runtime-6.0
```
Let's check if you've installed all of them.  

```shell
$ dotnet --info
.NET SDK (reflecting any global.json):
 Version:   6.0.413
 Commit:    10710f7d8e
Runtime Environment:
 OS Name:     ubuntu
 OS Version:  20.04
 OS Platform: Linux
 RID:         ubuntu.20.04-x64
 Base Path:   /usr/share/dotnet/sdk/6.0.413/
global.json file:
  Not found
Host:
  Version:      6.0.21
  Architecture: x64
  Commit:       e40b3abf1b
.NET SDKs installed:
  6.0.413 [/usr/share/dotnet/sdk]
.NET runtimes installed:
  Microsoft.AspNetCore.App 6.0.21 [/usr/share/dotnet/shared/Microsoft.AspNetCore.App]
  Microsoft.NETCore.App 6.0.21 [/usr/share/dotnet/shared/Microsoft.NETCore.App]
Download .NET:
  https://aka.ms/dotnet-download
Learn about .NET Runtimes and SDKs:
  https://aka.ms/dotnet/runtimes-sdk-info
```
## VS Code
Search for `c#` as a keyword, and install `C# Dev Kit` including others.  

| Extension    | Comment                              | Reference                                                                        |
| ------------ | ------------------------------------ | -------------------------------------------------------------------------------- |
| C# Dev Kit   | C# Basic environment for development | https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit      |
| Visual Nuget | Managing Nuggets Packages            | https://marketplace.visualstudio.com/items?itemName=FullStackSpider.visual-nuget |

![this is caption](/assets/images/230928213423/vs_code-csharp-dev-kit-extension.png)  
*[this is caption]*  
Open `View > Terminal`. And create my project folder and create console projects.  

```shell
mkdir <my workspace>/my_csharp
cd <my workspace>/my_csharp
dotnet new console
```
Write the contents of `Program.cs` based on the template below.  
https://learn.microsoft.com/ko-kr/dotnet/core/tutorials/top-level-templates  

```csharp
using System;  
namespace MyApp // Note: actual namespace depends on the project name.
{
	internal class Program
	{	
		static void Main(string[] args)	
		{		
			Console.WriteLine("Hello World!");		
		}
	}
}
```
### Generate Assets for Build and Debug
You can create an Asset from `Command Palette...`  
![VS Code-generate-asset-for-build-and-debug](/assets/images/230928213423/vs_code-generate-asset-for-build-and-debug.png)  
### Manage Nuget Packets
Package management is possible through "Visual Nuget:Manage Packages" right-click on the project file. This is enabled by the "Visual Nuget" extension installed above.  
![VS Code-visual-nuget](/assets/images/230928213423/vs_code-visual-nuget.png)  
