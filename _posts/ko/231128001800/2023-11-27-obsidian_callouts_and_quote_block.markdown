---
title:  옵시디언 콜아웃 및 인용 블록
image:
  path: /assets/images/231128001800/ko-thumb-unclesnote-obsidian_callouts_and_quote_block.png
  alt: 옵시디언 콜아웃 및 인용 블록
images: ["/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-quotation_block.png", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_block.png", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-folding_of_callouts_block.gif", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_predefined_types.png"]
categories: [옵시디언]
tags: [옵시디언, 콜아웃, 인용부호]
description:  콜아웃(callout)의 사전적 정의는 큰 소리로 외치는 것이며, 독자의 주의를 끌고 중요하거나 추가 정보를 알리는 데 사용됩니다. Obsidian에서 콜아웃을 표현하는 문법과 종류에 대해 알아봅시다.
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-28 00:18:00 +0900
ro_id: 231128001800
ro_name: obsidian_callouts_and_quote_block
ro_ref: 231128001800/obsidian_callouts_and_quote_block
lang: ko
---
콜아웃(callout)의 사전적 정의는 큰 소리로 외치는 것이며, 독자의 주의를 끌고 중요하거나 추가 정보를 알리는 데 사용됩니다.  

Obsidian에서 콜아웃을 표현하는 문법과 종류에 대해 알아봅시다.  
## 인용 블록과 콜아웃 블록의 차이점
**인용 블록**은 각 줄에서 `>`로 시작하는 문장을 나열합니다.  

```
> 
> I am a quote block.
> It is a set of lines starting with `>`
> 
```
아래는 Obsidian의 기본 테마를 바탕으로 한 인용 블록의 형태입니다.  
![옵시디언 - 인용 블록](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-quotation_block.png)
_옵시디언 - 인용 블록_

인용 블록과 마찬가지로 **콜아웃 블록**은 `>`로 시작하는 줄 집합입니다. 단, 첫 번째 줄에 콜아웃 유형을 입력하고 제목을 추가하면 아이콘 모양과 색상을 지정할 수 있습니다.  

```
> [!tip] I'm a tip type, and here's the title.
> 
> I am a callouts block. 
> It is similar to a citation block, but you can specify a type and title for the first line.
> 
```
아래는 Obsidian 기본 테마의 팁 유형 설명 블록입니다.  
![옵시디언 - 콜아웃 블록](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_block.png)
_옵시디언 - 콜아웃 블록_

## 콜아웃 블록 접기 기능
구문상 콜아웃 블록은 인용 블록과 유사합니다. 그러나 인용 블록에 비해 다음과 같은 추가 기능이 있습니다.  
- 아이콘 추가
- 제목 추가
- `폴딩 기능`

위에서 콜아웃 블록에는 인용 블록에 추가 아이콘과 제목을 추가할 수 있다고 설명했습니다.  

게다가 콜아웃의 강점은 접기 기능이 있다는 점이다. Obsidian의 경우 제목을 접을 수 있지만 **콜아웃 블록과 차이점은 초기값을 지정할 수 있다는 점**입니다.  

강조하고 싶은 내용을 콜아웃 블록에 표현하거나 추가 메모를 추가할 수도 있지만, 내용이 길면 처음에는 닫아 두는 것이 좋습니다.  
![옵시디언 - 콜아웃 블록 접기](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-folding_of_callouts_block.gif)
_옵시디언 - 콜아웃 블록 접기_

콜아웃 블록의 첫 번째 줄에 있는 유형 옆에 하이픈(-)을 추가하여 초기 값이 닫힘인 콜아웃 블록을 생성할 수 있습니다.  

```
> [!success]- Callouts block - Initially folded callouts block
> I am a callouts of type success.
```
## 콜아웃 블록 유형
Obsidian에서 미리 정의된 콜아웃 블록의 색상과 아이콘은 다음과 같습니다.  

콜아웃 유형에 원하는 텍스트를 작성하여 콜아웃의 모양을 변경할 수 있습니다.  
![옵시디언 - 콜아웃 사전 정의된 유형](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_predefined_types.png)
_옵시디언 - 콜아웃 사전 정의된 유형_

해당 내용은 [Obsidian 도움말](https://help.obsidian.md/Editing+and+formatting/Callouts){:target="_blank"}에 소개되어 있으며, CSS를 정의하여 나만의 콜아웃 블록을 디자인할 수 있습니다.  

```
> [!quote] quote

> [!abstract] abstract, summary, tldr

> [!important] tip, hint, important

> [!note] note

> [!info] info

> [!todo] todo

> [!example] example

> [!question] question, help, fnq

> [!warning] warning, caution, attention

> [!failure] failure, fail, missing

> [!danger] danger, error

> [!bug] bug
```
