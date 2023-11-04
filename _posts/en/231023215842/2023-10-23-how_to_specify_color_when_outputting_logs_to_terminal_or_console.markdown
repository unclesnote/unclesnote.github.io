---
title:  How to specify color when outputting logs to terminal or console
image:
  path: /assets/images/231023215842/en-thumb-unclesnote-how_to_specify_color_when_outputting_logs_to_terminal_or_console.png
  alt: How to specify color when outputting logs to terminal or console
images: 
categories: [Ubuntu, Common]
tags: [VSCode, Terminal, DebugConsole, Output, Ubuntu, Common]
description:  When developing software, logs help you check operation and find the cause of problems. It would be helpful if the logs for critical error or warning levels
public: true
toc: true
toc_intl: false
# Below is readonly values if it's decided once
layout: post
date: 2023-10-23 21:58:42 +0900
ro_id: 231023215842
ro_name: how_to_specify_color_when_outputting_logs_to_terminal_or_console
ro_ref: 231023215842/how_to_specify_color_when_outputting_logs_to_terminal_or_console
lang: en
---
When developing software, logs help you check operation and find the cause of problems. It would be helpful if the logs for critical error or warning levels had colors that were easy to find.  

You can set the color of the log text in the IDE you are using, such as VS Code or Visual Studio, but if the software is run without an IDE or in a cross-compilation environment such as Linux, the setting will not be applied. Therefore, I will introduce a method to set the color of text independently from the terminal perspective.  
> **How to change output text color in Visual Studio Code**  
> In the case of VS Code, you can change the color of the Debug Console or Output window by setting the color value in `workbench.colorCustomizations` in `Settings > User > Workbanch > Appearance > Edit in Settings.json`.  
> For parameters of `workbench.colorCustomizations`, please refer to the link below.  
>   
> [https://code.visualstudio.com/api/references/theme-color](https://code.visualstudio.com/api/references/theme-color){:target="_blank"}    
{: .prompt-info}
## How to set text color
To change the text color, you need to center the text you want and add the code below at the beginning and end.  
- **Start** : `(Escape Character)[(Style Code);(Text Color);(Background Color)m`
- **Text** : `(Text you want)`
- **End** : `(Escape Character)[0m`

In the end, one line with the text color changed will have the format below.  
- `(Escape Character)[(Style Code);(Text Color);(Background Color)m`  `(text you want)`  `(Escape Character)[0m`

Below is an example of the string `I am text` in bold white text on a black background.  

For the meaning of each number, check the predefined code in the later section.  

```
\u001b[1;37;40mI am text\u001b[0m
```
Let’s look at the table below first. Each element for changing the text color is listed.  

| Element                | Mandatory | Comment                                                                                                                                                     |
| ---------------------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Escape Character       | Yes       | Use Unicode, octal, or hexadecimal escape characters, whichever suits you.                                                                                  |
| Style Code             | Optional  | Text styles such as bold, blink, dim, and underline.                                                                                                        |
| Text Color             | Optional  | Text color by selecting from already defined color codes.                                                                                                   |
| Text(Foreground) Color | Optional  | Text background color by selecting from already defined color codes.                                                                                        |
| `(Escape Character)[0m`  | Yes       | Resets the text color and style once set.<br>If you want to change the color of multiple lines, you can reset the text color later at the desired location. |

Although the `Escape Chacter` is mandatory, you can use one of the three described later depending on the expression method.  

You can add the `Style`, `Text Color`, and `Background Color` to suit your taste by separating them with `;`. We will explain the options that can be expressed later, but the order does not matter because the numbers representing each are unique.  

And finally, reset the text color and style using `(Escape Character)[0m`. Unless reset, subsequent text colors and styles will continue.  
## Color and Style Codes
### 1. Escape Character
The escape character below is the same as 27 in ASCII code, and the expression method is as follows, and you can use any one.  
- `\u001b` : Unicode Escape Character. It represents the escape character using a 4-digit hexadecimal Unicode code point after `\u`.
- `\033` :  This represents the escape character using octal notation
- `\x1b` : This represents the escape character using hexadecimal notation

### 2. Style
You can choose a text style, but I doubt it's necessary. Logs should be easy to read.  
- `1`: Bold (or intense color)
- `2`: Dim (or faint)
- `4`: Underline
- `5`: Blink (rapidly blinking text)
- `7`: Invert (swap foreground and background colors)
- `8`: Hidden (invisible text)

### 3.  Text(Foreground) Color
These are codes that change the text color. Think of it as overriding the defaults of the terminal client software you are using.  
- `30`: Black
- `31`: Red
- `32`: Green
- `33`: Yellow
- `34`: Blue
- `35`: Magenta
- `36`: Cyan
- `37`: White

### 4. Background Color
- `40`: Black background
- `41`: Red background
- `42`: Green background
- `43`: Yellow background
- `44`: Blue background
- `45`: Magenta background
- `46`: Cyan background
- `47`: White background

###  5. Color Reset
If you do not reset the text color and style, it will continue as initially set.  

Typically, it is added to the end of the text in the form `(Escape Character)[0m`.  
- `0`: Reset all styles and colors to default
