---
title:  Obsidian のコールアウトと引用ブロック
image:
  path: /assets/images/231128001800/ja-thumb-unclesnote-obsidian_callouts_and_quote_block.png
  alt: Obsidian のコールアウトと引用ブロック
images: ["/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-quotation_block.png", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_block.png", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-folding_of_callouts_block.gif", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_predefined_types.png"]
categories: [黒曜石]
tags: [黒曜石, コールアウト, 引用]
description:  辞書のコールアウトの定義は、大声で呼びかけることであり、読者の注意を引き、重要な情報や追加情報を知らせるために使用されます。 Obsidian で吹き出しを表現するための文法と型について学びましょう。
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-28 00:18:00 +0900
ro_id: 231128001800
ro_name: obsidian_callouts_and_quote_block
ro_ref: 231128001800/obsidian_callouts_and_quote_block
lang: ja
---
辞書のコールアウトの定義は、大声で呼びかけることであり、読者の注意を引き、重要な情報や追加情報を知らせるために使用されます。  

Obsidian で吹き出しを表現するための文法と種類について学びましょう。  
## 引用ブロックと吹き出しブロックの違い
**引用ブロック**には、各行の `>` で始まる文がリストされます。  

```
> 
> I am a quote block.
> It is a set of lines starting with `>`
> 
```
以下は、Obsidian の基本テーマに基づいた引用ブロックの形状です。  
![黒曜石 - 引用ブロック](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-quotation_block.png)
_黒曜石 - 引用ブロック_

引用ブロックと同様に、**コールアウト ブロック**は `>` で始まる一連の行です。ただし、最初の行に吹き出しの種類を入力してアイコンの形状と色を指定し、タイトルを追加することができます。  

```
> [!tip] I'm a tip type, and here's the title.
> 
> I am a callouts block. 
> It is similar to a citation block, but you can specify a type and title for the first line.
> 
```
以下は、Obsidian 基本テーマのチップ タイプの吹き出しブロックです。  
![黒曜石 - 吹き出しブロック](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_block.png)
_黒曜石 - 吹き出しブロック_

## 吹き出しブロック折りたたみ機能
構文的には、コールアウト ブロックは引用ブロックに似ています。ただし、引用ブロックと比較して、次の追加機能があります。  
- アイコンの追加
- 表題を加える
- `折りたたみ機能`

上で、吹き出しブロックには追加のアイコンやタイトルを引用ブロックに追加できることを説明しました。  

さらに、吹き出しの強みは折りたたみ機能があることです。 Obsidian の場合、見出しを折りたたむことができますが、**吹き出しブロックとの違いは、初期値を指定できることです**。  

場合によっては、強調したいコンテンツを表現したり、吹き出しブロックに注釈を追加したりすることができますが、コンテンツが長い場合は、最初は閉じたままにしておくことができます。  
![黒曜石 - 吹き出しブロックの折り畳み](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-folding_of_callouts_block.gif)
_黒曜石 - 吹き出しブロックの折り畳み_

コールアウト ブロックの最初の行のタイプの横にハイフン (-) を追加すると、初期値が close のコールアウト ブロックを作成できます。  

```
> [!success]- Callouts block - Initially folded callouts block
> I am a callouts of type success.
```
## 吹き出しブロックのタイプ
Obsidian の事前定義された吹き出しブロックの色とアイコンは次のとおりです。  

吹き出しの種類に好みのテキストを書き込むことで、吹き出しの外観を変更できます。  
![Obsidian - コールアウトの定義済みタイプ](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_predefined_types.png)
_Obsidian - コールアウトの定義済みタイプ_

この内容は [Obsidian Help](https://help.obsidian.md/Editing+and+formatting/Callouts){:target="_blank"} で紹介されており、CSS を定義することで独自の吹き出しブロックをデザインできます。  

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
