---
title:  黑曜石的标注和报价块
image:
  path: /assets/images/231128001800/zh-thumb-unclesnote-obsidian_callouts_and_quote_block.png
  alt: 黑曜石的标注和报价块
images: ["/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-quotation_block.png", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_block.png", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-folding_of_callouts_block.gif", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_predefined_types.png"]
categories: [黑曜石]
tags: [黑曜石, 标注, 引号]
description:  字典中标注的定义是大声喊出，用于引起读者的注意并告知他们重要或附加信息。让我们了解一下 Obsidian 中表达标注的语法和类型。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-28 00:18:00 +0900
ro_id: 231128001800
ro_name: obsidian_callouts_and_quote_block
ro_ref: 231128001800/obsidian_callouts_and_quote_block
lang: zh
---
字典中标注的定义是大声喊出，用于引起读者的注意并告知他们重要或附加信息。  

让我们了解一下 Obsidian 中表达标注的语法和类型。  
## 引用块和标注块之间的差异
**引用块**列出每行以`>`开头的句子。  

```
> 
> I am a quote block.
> It is a set of lines starting with `>`
> 
```
下面是基于 Obsidian 基本主题的报价块的形状。  

![黑曜石 - 报价块](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-quotation_block.png)
_黑曜石 - 报价块_

与引用块一样，**标注块**是一组以`>`开头的行。但是，您可以通过在第一行中输入标注类型来指定图标形状和颜色，并添加标题。  

```
> [!tip] I'm a tip type, and here's the title.
> 
> I am a callouts block. 
> It is similar to a citation block, but you can specify a type and title for the first line.
> 
```
下面是黑曜石基本主题中的提示类型标注块。  

![黑曜石 - 标注块](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_block.png)
_黑曜石 - 标注块_

## 标注块折叠功能
从语法上讲，标注块与引用块类似。然而，与报价块相比，它具有以下附加功能  
- 添加图标
- 添加标题
- `折叠功能`

上面解释了标注块可以将附加图标和标题添加到引用块中。  

此外，标注的优点在于它们具有折叠功能。对于 Obsidian，标题可以折叠，但是**这与标注块之间的区别在于可以指定初始值**。  

有时，您可以在标注块中表达要强调的内容或添加附加注释，但如果内容很长，您可能希望将其最初关闭。  

![黑曜石 - 标注块的折叠](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-folding_of_callouts_block.gif)
_黑曜石 - 标注块的折叠_

您可以通过在标注块第一行的类型旁边添加连字符 (-) 来创建初始值为 close 的标注块。  

```
> [!success]- Callouts block - Initially folded callouts block
> I am a callouts of type success.
```
## 标注块类型
Obsidian 中预定义标注块的颜色和图标如下。  

您可以通过在标注类型中写入您喜欢的文本来更改标注的外观。  

![Obsidian - 标注预定义类型](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_predefined_types.png)
_Obsidian - 标注预定义类型_

此内容在[Obsidian Help](https://help.obsidian.md/Editing+and+formatting/Callouts){:target="_blank"}中有介绍，您可以通过定义CSS来设计自己的callouts块。  

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
