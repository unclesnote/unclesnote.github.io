---
title:  Ubuntu에서 VS Code를 사용하여 C 개발 환경을 만드는 방법
image:
  path: /assets/images/230928213423/ko-thumb-vs_code-csharp-dev-kit-extension.png
  alt: Ubuntu에서 VS Code를 사용하여 C 개발 환경을 만드는 방법
images: ["/assets/images/230928213423/vs_code-csharp-dev-kit-extension.png", "/assets/images/230928213423/vs_code-generate-asset-for-build-and-debug.png", "/assets/images/230928213423/vs_code-visual-nuget.png"]
categories: [C 샤프, VS 코드]
tags: [CSharp, 개발, 비주얼스튜디오, VSCode]
description:  C# 소프트웨어는 일반적으로 Windows의 Visual Studio에서 개발할 수 있습니다. 그러나 Ubuntu 환경에서도 개발이 가능합니다. 잘 알려진 IDE로는 Mono 프로젝트에서 제공하는 MonoDevelop이 있습니다. 하지만 이보다 더 많은 것을 사용하는 VS Code C# 소프트웨어 개발 환경을 만들어 보겠습니다. 우분투 20.04 기준입니다.
toc: false
# Below is readonly values if it's decided once
layout: post
date: 2023-09-28 21:34:23 +0900
ro_id: 230928213423
ro_name: how_to_create_a_c_development_environment_using_vs_code_in_ubuntu
ro_ref: 230928213423/how_to_create_a_c_development_environment_using_vs_code_in_ubuntu
lang: ko
---
C# 소프트웨어는 일반적으로 Windows의 Visual Studio에서 개발할 수 있습니다. 그러나 Ubuntu 환경에서도 개발이 가능합니다. 잘 알려진 IDE로는 Mono 프로젝트에서 제공하는 MonoDevelop이 있습니다. 하지만 이보다 더 많은 것을 사용하는 VS Code C# 소프트웨어 개발 환경을 만들어 보겠습니다. 우분투 20.04 기준입니다.  
## .NET 제품군 설치
먼저 .net이 포함된 저장소를 추가하겠습니다. 그리고 아래 3개를 설치해 보도록 하겠습니다. 나머지 3개는 .NET SDK 설치만으로 함께 설치되었습니다. 확인을 위해 나머지 두 개를 살펴보시기 바랍니다.  
- .NET SDK
- .NET 코어
- ASP.NET 코어

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
모두 설치했는지 확인해 보겠습니다.  

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
## VS 코드
키워드로 `c#`을 검색하고, 기타 `C# Dev Kit`를 포함하여 설치합니다.  

| Extension    | Comment                              | Reference                                                                        |
| ------------ | ------------------------------------ | -------------------------------------------------------------------------------- |
| C# Dev Kit   | C# Basic environment for development | https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit      |
| Visual Nuget | Managing Nuggets Packages            | https://marketplace.visualstudio.com/items?itemName=FullStackSpider.visual-nuget |

![이건 캡션이에요](/assets/images/230928213423/vs_code-csharp-dev-kit-extension.png)  
*[이건 캡션이에요]*  
`보기 > 터미널`을 엽니다. 그리고 내 프로젝트 폴더를 만들고 콘솔 프로젝트를 만듭니다.  

```shell
mkdir <my workspace>/my_csharp
cd <my workspace>/my_csharp
dotnet new console
```
아래 템플릿을 기반으로 `Program.cs`의 내용을 작성합니다.  
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
### 빌드 및 디버그를 위한 자산 생성
'명령 팔레트...'에서 자산을 생성할 수 있습니다.  
![VS Code-generate-asset-for-build-and-debug](/assets/images/230928213423/vs_code-generate-asset-for-build-and-debug.png)  
### 너겟 패킷 관리
프로젝트 파일을 마우스 오른쪽 버튼으로 클릭하면 "Visual Nuget:Manage Packages"를 통해 패키지 관리가 가능합니다. 이는 위에 설치된 "Visual Nuget" 확장을 통해 활성화됩니다.  
![VS Code-visual-nuget](/assets/images/230928213423/vs_code-visual-nuget.png)  
