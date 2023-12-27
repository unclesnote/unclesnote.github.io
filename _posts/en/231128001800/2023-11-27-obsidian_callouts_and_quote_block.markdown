---
title:  Obsidian's Callouts And Quotation Block
image:
  path: /assets/images/231128001800/en-thumb-unclesnote-obsidian_callouts_and_quote_block.png
  alt: Obsidian's Callouts And Quotation Block
images: ["/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-quotation_block.png", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_block.png", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-folding_of_callouts_block.gif", "/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_predefined_types.png"]
categories: [Obsidian]
tags: [Obsidian, Callouts, Quotes]
description:  The dictionary definition of callout(s) is to call out loudly, and is used to draw the reader's attention and inform them of important or additional
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-11-28 00:18:00 +0900
ro_id: 231128001800
ro_name: obsidian_callouts_and_quote_block
ro_ref: 231128001800/obsidian_callouts_and_quote_block
lang: en
---
The dictionary definition of callout(s) is to call out loudly, and is used to draw the reader's attention and inform them of important or additional information.  

Let's learn about the grammar and types for expressing callouts in Obsidian.  
## Differences between quotation and callouts blocks
A **quotation block**lists sentences starting with `>` on each line.  

```
> 
> I am a quote block.
> It is a set of lines starting with `>`
> 
```
Below is the shape of the quotation block based on Obsidian's basic theme.  

![Obsidian - Quotation Block](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-quotation_block.png)
_Obsidian - Quotation Block_

Like a quotation block, a **callouts block**is a set of lines that start with `>`. However, you can specify the icon shape and color by entering a callouts type in the first line, and add a title.  

```
> [!tip] I'm a tip type, and here's the title.
> 
> I am a callouts block. 
> It is similar to a citation block, but you can specify a type and title for the first line.
> 
```
Below is a tip type callouts block in the Obsidian basic theme.  

![Obsidian - Callouts Block](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_block.png)
_Obsidian - Callouts Block_

## Callouts Block Folding Function
Syntactically, callouts blocks are similar to quotation blocks. However, compared to quotation blocks, it has the following additional features  
- Add icon
- Add title
- `Folding function`

Above, it was explained that the callouts block can have additional icons and titles added to the quotation block.  

Additionally, the strength of callouts is that they have a folding function. In the case of Obsidian, headings can be folded, but **the difference between this and a callouts block is that the initial value can be specified**.  

Sometimes, you can express content you want to emphasize or add additional notes to in a callouts block, but if the content is long, you may want to leave it initially closed.  

![Obsidian - Folding of Callouts Block](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-folding_of_callouts_block.gif)
_Obsidian - Folding of Callouts Block_

You can create a callouts block with an initial value of closed by adding a hyphen (-) next to the type in the first line of the callouts block.  

```
> [!success]- Callouts block - Initially folded callouts block
> I am a callouts of type success.
```
## Callouts Block Types
The colors and icons of the predefined callouts blocks in Obsidian are as follows.  

You can change the look of the callouts by writing the text you like in the callouts type.  

![Obsidian - Callouts Predefined Types](/assets/images/231128001800/unclesnote-obsidian_callouts_and_quote_block-obsidian-callouts_predefined_types.png)
_Obsidian - Callouts Predefined Types_

This content is introduced in [Obsidian Help](https://help.obsidian.md/Editing+and+formatting/Callouts){:target="_blank"}, and you can design your own callouts block by defining CSS.  

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
